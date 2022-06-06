# GROUP BY deyimi

Birçok ayrı kategori için toplam bir değer hesaplamamız gerektiğini hayal edin. Örneğin, fiyatlara ilişkin geçmiş verileri içeren hisse senetleri adında bir tablo var.

| stock_name	| price	| datetime |
| --- | --- | --- |
| WTI |	89.8 | 2020-05-17 11:00 |
| Facebook | 26.3 |	2020-04-11 10:23 |
| WTI |	18.9 | 2019-01-18 23:02 |
| WTI	| 20.9 |	2019-01-18 23:02 |
| Facebook |	15.6	| NULL |
| DJI	| 52.7	| 2004-05-28 21:09 |
| Facebook |	63.7	| 1998-03-31 04:18 |

Her kategori için böyle bir sorgu yürütmek mümkündür ancak oldukça zahmetlidir:

```
SELECT MAX(price)
FROM stocks
WHERE stock_name = 'WTI';
```

Bundan daha da fazlası, tüm hisse senetleri için bir tablo şeklinde karşılık gelen sonuçları elde etmek ve 
bunu daha sonraki hesaplamalar için kullanmak istersek ne olur?
Böyle bir iş yükünü basitleştirmek için SQL'de ```GROUP BY``` deyimi tanıtıldı.

## Genel form

```GROUP BY```'ı görev için şu şekilde kullanabiliriz:

```
SELECT
    stock_name, 
    MAX(price) AS maximum
FROM 
    stocks
GROUP BY
    stock_name;
```
  
Çıktı şöyle görünecektir:

| stock_name | maximum |
| --- | --- |
| WTI	| 89.8 |
| Facebook | 63.7 |
| DJI	| 52.7 |

Bu sorgu hakkında bu kadar özel olan ne? ```GROUP BY``` deyiminde tablodan bir sütunun adını belirtiyoruz. 
Bu sütundaki her benzersiz değer, ```SELECT``` bloğundan kullanılan her toplama işlevinin kendi sonucunu alacaktır. 
Bu değere karşılık gelen satırlar girdi olarak alınacaktır.

Hiçbir şey birden fazla toplama işlevi kullanmamızı yasaklamaz. Döndürülen değerler birbirinden tamamen bağımsız olabilir:

```
SELECT
    stock_name,
    MIN(datetime) AS moment,
    MAX(price) AS maximum
FROM
    stocks
GROUP BY
    stock_name;
```

| stock_name |	moment |	maximum |
| --- | --- | --- |
| WTI |	2019-01-18 23:02 |	89.8 |
| Facebook	| 1998-03-31 04:18 | 63.7 |
| DJI |	2004-05-28 21:09 |	52.7 |

```GROUP BY``` yan tümcesinde birkaç sütun varsa, bu sütunlardan gelen her benzersiz değer kombinasyonu ayrı ayrı toplanacaktır.

```
SELECT
    stock_name,
    datetime,
    MAX(price)
FROM
    stocks
GROUP BY
    stock_name,
    datetime;
```

| stock_name |	datetime |	price |
| --- | --- | --- |
| WTI |	2020-05-17 11:00 |	89.8 |
| Facebook | 2020-04-11 10:23 |	26.3 |
| WTI	| 2019-01-18 23:02	| 20.9 |
| Facebook | NULL |	15.6 |
| DJI	| 2004-05-28 21:09	| 52.7 |
| Facebook | 1998-03-31 04:18 |	63.7 |

Burada NULL değerinin benzersiz bir değer olarak kabul edildiğinden ayrı bir kategori oluşturduğunu görüyoruz. 
WTI, 2019-01-18 23:02 için iki sıra, maksimum 20.9 fiyatla birleştirildi. Sonuç açısından, herhangi bir toplama işlevi olmayan grup sorgusu şuna eşittir:

```
SELECT DISTINCT 
    stock_name,
    datetime
FROM
    stocks;
```

GROUP BY yan tümcesinde bir sütundan bahsedilmiyorsa ve SELECT'te kullanılan en az bir toplama işlevi varsa, 
bu sütun, bir toplama işlevine sarılmadan sorgunun SELECT bölümünde kullanılamaz.

## HAVING anahtar kelimesi

GROUP BY deyimi içeren sorgular, WHERE deyimi ile satırları filtrelemeye ve ORDER BY deyimi ile sıralamaya izin verecek şekilde düzenlidir. 
Gruplama görevlerinde özellikle yardımcı olan başka bir madde daha var: ```HAVING```. 
WHERE, belirli hücrelerin sahip olduğu değerlere ilişkin koşulları kabul ederse, HAVING, önceden hesaplanmış toplamaların değerleri dışında aynı şeyi yapar. 
Örneğin, maksimum fiyatı 50'nin üzerinde olan "stock-datetime" çiftlerini seçelim:

```
SELECT
    stock_name,
    datetime,
    MAX(price) AS maximum
FROM
    stock
GROUP BY 
    stock_name,
    datetime
HAVING
    MAX(price) > 50;
```

| stock_name	| datetime | maximum |
| --- | --- | --- |
| WTI |	2020-05-17 11:00 | 89.8 |
| DJI	| 2004-05-28 21:09	| 52.7 |
| Facebook | 1998-03-31 04:18 |	63.7 |

"Neden Where ile filtrelemiyoruz?" Bunun nedeni, ifadelerin değerlendirme sırasıdır:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY

HAVING'e koyduğunuz tüm koşullar, toplama işlevleriyle ilgili olmalıdır. Ancak bunun dışında özel bir kısıtlama yoktur.

Özetle, gruplamalı sorgular için şablon şudur:

```
SELECT column_name [, list_of_other_columns]
     , aggregation [, list_of_aggregations]
FROM table_name
[WHERE list_of_conditions]
GROUP BY column_name [, list_of_other_columns]
[HAVING list_of_aggregate_conditions]
[ORDER BY list_of_columns/aliases];
```
GROUP BY, tartışmasız en yaygın SQL ifadelerinden biridir. Sorguları gruplamadan nispeten ciddi bir SQL kod tabanı bulmak oldukça zor olurdu. 
