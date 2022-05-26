# NULL

Nobel ödülleriyle ilgili verileri depolamak için bir tablo oluşturduğunuzu hayal edin. 
Kazananların yaşını değerlendirmek için şu sütunları tanımladınız: 
- yıl,
- alan, 
- kazananın adı ve 
- kazananın doğum yılı. 

Ancak bazı kazananlar için, örneğin 2012'de Nobel Barış Ödülü'nü alan Avrupa Birliği vatandaşları için doğum yılı tanımlanmamıştır.
Bu hücrelerde, ancak potansiyel olarak hatalara yol açabilir. 
Bu gibi durumlarda SQL'in özel bir değeri vardır: ```NULL```.

```NULL```, SQL'de bazı veri değerlerinin bilinmediğini veya tanımlanmadığını belirtmek için kullanılır. ```0 veya ''``` değeri ile karıştırılmamalıdır.
İşlenenler arasında NULL olan aritmetik veya dize ifadeleri NULL olarak değerlendirilir.

NULL değeri, herhangi bir türdeki bir sütunda saklanabilir. 
Ancak bir yazılım mühendisi, bir sütunun NULL değerleri **saklamaması gerektiğini** belirtmek için tablo deyimi oluşturmada bir ```NOT NULL``` kısıtlaması kullanabilir. 
Örneğin, bu koda göre, yalnızca "kazananlar_dogum_yili" sütunu NULL'ları içerebilir:
```
CREATE TABLE kazananlar ( 
    yil INTEGER NOT NULL,
    alan VARCHAR(20) NOT NULL, 
    kazanan_adi VARCHAR(100) NOT NULL, 
    kazanan_dogum_yili INT
    );
```

## NULL ile karşılaştırmalar

NULL değeri temel olarak *"değer yok"* anlamına gelir. Bu nedenle, NULL ile karşılaştırmalar hiçbir zaman TRUE veya FALSE ile sonuçlanamaz, 
ancak her zaman üçüncü bir mantıksal sonuç olan ```BİLİNMEYEN``` ile sonuçlanır. 
Aslında, boolean türünün NULL değeridir ve bazı veri yönetim sistemleri, özel bir ```BİLİNMEYEN``` değeri ayırt etmez. 
Örneğin, aşağıdaki karşılaştırmaların her birinin sonucu: BİLİNMİYOR
```
NULL = 1
BOŞ <> 1
NULL > 1
NULL = '1'
BOŞ = BOŞ
```
Hiçbir şey NULL'a eşit değildir; NULL bile NULL'a eşit değildir!
Bir ifadenin veya değerin boş olup olmadığını nasıl kontrol edebiliriz? SQL bunun için özel yüklemleri destekler: ```IS NULL``` ve ```IS NOT NULL```. 
Örneğin, her ikisinin de altındaki sorgular sonuç olarak TRUE değerini döndürür:
```
SELECT 0+NULL IS NULL;
SELECT '' IS NOT NULL;
```
Aşağıdaki sorgular FALSE olarak değerlendirilir:
```
SELECT NULL IS NOT NULL;
SELECT 1-1 IS NULL;
```

BİLİNMEYEN işlenenlere sahip mantık ifadelerinde, BİLİNMEYEN, bir işlenene bağlıysa sonuç BİLİNMEYEN olur. 
Bu nedenle, karşılaştırmaların aksine, bir işlenen BİLİNMİYOR olsa bile, bir mantıksal ifadenin sonucu BİLİNMEYEN'den farklı bir şey olabilir. 
Aşağıdaki örnekleri ele alalım:
```
(NULL = 1) AND TRUE, UNKNOWN olarak değerlendirilir (sonuç, yalnızca her iki işlenen de TRUE ise DOĞRU olur),
(NULL = 1) OR TRUE, DOĞRU'ya eşittir (en az bir işlenen DOĞRU olduğundan sonuç DOĞRU'dur).
```
SQL'de NULL değerinin kilit noktalarını tekrarlayalım:

- **NULL** SQL'de bazı veri değerlerinin bilinmediğini veya tanımlanmadığını belirtmek için kullanılır.
- **NOT NULL** Bir sütunun NULL değerleri saklamaması gerektiğini belirtmek için bu kısıtlamayı kullanın.
- Bir ifadenin veya değerin null olup olmadığını **IS NULL** ve **IS NOT NULL** ile kontrol edin.
- NULL değerleriyle mantık da mümkündür: **TRUE**, **FALSE** ve **UNKNOWN** bir ifadenin sonucu olabilir.
