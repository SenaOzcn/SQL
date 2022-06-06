# Toplama

Bir finansal danışmanlık şirketinde iş analisti olduğunuzu hayal edin. Dün borsada yaşananlar hakkında bir rapor hazırlayarak güne başlıyorsunuz. 
Taahhüt edilen anlaşmalarla ilgili bilgiler, ```SQL``` uyumlu bir veritabanında yüz binlerce satırlık tablolarda depolanır. 
Bu tür veri hacmi üzerinde tam hesaplama yapmak gerçekçi olmadığı için sütunlardan tüm verileri seçmek işe yaramaz. 
Normal SQL işlevleri, her hücreye *ayrı ayrı* uygulandıkları ve sonuçlarını birleştirmenin hiçbir yolu olmadığı için pek yardımcı olmaz. 
Bunun yerine yapabileceğiniz şey, toplu işlevleri uygulamaktır ve bu konu tamamen bunlarla ilgilidir.

## Genel form

Bir toplama işlevi yürütmek ve bir sütundaki tüm değerleri ona iletmek için aşağıdaki sözdizimini kullanın:

```
SELECT AGG_FUNCTION(column_name)
FROM table_name;
```

İşlev, belirtilen sütundaki tüm değerleri alacak ve sonuç olarak tek bir hücre üretecektir. Sonuç olarak, n adet toplama işlevini çalıştırmak aynı anda n hücre üretir.

Farklı SQL uyumlu veritabanı yönetim sistemlerinin satıcıları, kullanıcılarına biraz farklı toplu işlev kümeleri sağlar. 
SQL standardına göre toplu işlevlerin listesi:

- MIN
- MAX
- AVG
- COUNT
- SUM

Ayrıca popülasyon standart sapması veya korelasyon katsayısı gibi istatistiklerle ilgili birkaç ayrıntılı işlev vardır. 
Toplu işlevlerin tam listesini kontrol etmek için zaman ayırmaya değer olabilir.

Örnek: 'stocks' adlı bu tabloyu düşünün :

| stock_name |price	| yesterday_deals |
| --- | --- | --- |
| WTI |	89.8	| NULL |
| NVAX |	26.3	| 5 |
| GSPC |	18.9	| 20 |
| DJI |	40	| 2 |
| NYSE |	15.6	| 13 |
| TCHENY |	52.7 | 5 |
| Facebook |	63.7 | 20 |

```MAX``` Fonksiyonu kullanarak, tüm hisse senetleri arasında en yüksek fiyatı kolayca bulabiliriz:

```
SELECT MAX(price)
FROM stocks;
```

Bu sorgu, ```89.8```i üretecektir. Aynı şekilde, ```MIN``` aynı sütun için fonksiyon bize ```15.6```yı verirdi. 
Dün yapılan anlaşmaların sayısını bilmek istiyorsak, bu sorguyu kullanabiliriz:

```
SELECT SUM(yesterday_deals)
FROM stocks;
```

```65``` döndürür..

```INT``` veya ```REAL``` gibi sayısal türler, çoğu toplama işlevi için doğal olarak uygundur. 
Bununla birlikte, bazı durumlarda, diğer veri türleriyle birlikte toplama işlevlerini kullanmak da mantıklıdır. 
Örneğin, ```MIN``` ve ```MAX``` işlevleri, sırasıyla sözlükbilimsel olarak en küçük ve en büyük dizeleri bulmak için kullanılabilir. 

## WHERE ekleme

Toplama işlevlerimizi çalıştırmak istediğimiz satırların bir alt kümesini seçmek için kullanmak da mümkündür. 
Örneğin, fiyatı 40'tan fazla olan tüm hisse senetleri için ortalama fiyatı ve ortalama işlem sayısını bulalım:

```
SELECT 
    AVG(price) AS avg_price,
    AVG(yesterday_deals) AS avg_deals 
FROM 
    stocks 
WHERE 
    price > 40;
```

Cevap şöyle olacaktır:

| avg_price	| avg_deals |
| --- | --- |
| 68.733333333 | 12.5 |

## DISTINCT anahtar kelime

Büyük miktarda veriyle çalışırken, yinelenen tüm değerleri atlamak isteyebilirsiniz. 
Bunu yapmak için, ```DISTINCT``` anahtar kelimeyi toplama işlevinizin *parantezlerinin içine* yerleştirin:

```
SELECT COUNT(DISTINCT yesterday_deals)
FROM stocks;
```

```yesterday_deals``` sütununda yalnızca 4 farklı sayısal değer olduğu için bu sorgu dönecektir.

Benzersiz değerler kümesini belirlemek, hesaplama karmaşıklığı açısından maliyetli olabilir, bu nedenle DISTINCT kullanmak mantıklıdır. 
Her zaman kopyaları gerçekten çıkarmanız gerekip gerekmediğini ve bunun nihai sonucu nasıl etkileyebileceğini düşünün.

## COUNT(*)

Bir sütun adı ile işlevin bağımsız değişken olarak normal bir çağrısı, ```COUNT``` yalnızca *sütundaki toplam* değer miktarını sayacaktır. 
Yıldız işareti ile çağırırsanız, fonksiyona tabloda bulunan tüm ```COUNT``` satırları saymasını söylersiniz. 
Nihai sonuç, belirli sütun türlerinden veya hücrelerinin depoladığı değerlerden etkilenmeyecektir.

COUNT(*) dışındaki tüm toplama işlevleri NULL değerlerini yok sayar.
