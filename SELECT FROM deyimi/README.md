# SELECT FROM deyimi

SQL'in, çeşitli uygulama alanlarında kullanışlı olan tablolar halinde yapılandırılmış verileri işlemek için tasarlandığını zaten biliyorsunuz. 
Ayrıca, "table_name" adlı bir tablodan tüm verileri çıkarmak için aşağıdaki sorguyu kullanmanız gerektiğini de biliyorsunuz:

```
SELECT * FROM table_name;
```

## Projeksiyon

Son 5 gün için Londra'daki hava durumu hakkında bilgi depolayan bir "hava durumu" tablonuz olduğunu varsayalım.

| Gün | Saat | Sıcaklık | Hissedilen | Basınç | ... | Rüzgar Hızı | Rüzgar Yönü | Rüzgar Esintileri | Nem | Hava Durumu |
| --- | --- | --- | --- | ---| --- | --- | --- | --- | --- | --- |
| 1 | 1 | 14 | 14 | 754 | ... | 2 | W | 8 | 88 | Yağmurlu |
| 1 | 7 | 11 | 11 | 754 | ... | 1 | N | 1 | 92 | Yağmurlu |
| ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |
| 5 | 19 | 16 | 13 | 759 | ... | 5 | S | 11 | 93 | Yağmurlu |

Gördüğünüz gibi, her saat için birçok özellik var. Hepsine ihtiyacımız var mı? 
Sadece bir cep telefonu ekranında görüntülenecek olan gün, saat, sıcaklık, rüzgar hızı gibi temel bilgileri seçen bir sorgu yazalım.

```
SELECT
    gun, 
    saat,
    hava_durumu,
    sicaklik AS "Selsius Cinsinden Sıcaklık",
    hissedilen AS "Selsius Cinsinden Hissedilen Sıcaklık",
    ruzgar_hizi AS "m/s"
FROM
    havadurumu
;
```

Anahtar kelimeden sonra, ```SELECT``` seçmek istediğimiz sütunları listeler ve gerektiğinde takma adları belirtiriz. 
Sorgu değerlendirmesi aşağıdaki tabloda sonuçlanır:

| Gün | Saat | Hava Durumu | Selsius Cinsinden Sıcaklık | Selsius Cinsinden Hissedilen Sıcaklık | m/s |
| --- | --- | --- | --- | --- | --- |
| 1 | 1 | Yağmurlu | 14 | 14 | 2 |
| 1 | 7 | Yağmurlu | 11 | 11 | 1 |
| ... | ... | ... | ... | ... | ... |
| 5 | 19 | Yağmurlu | 16 | 13 | 5 |

Tablo sütunlarının bir alt kümesini seçtiğinizde veri çıkarma türüne projeksiyon denir.

İşte bu tür sorgular için genel bir şema: anahtar kelime SELECT, isteğe bağlı takma adlara sahip sütun adlarının listesi, 
anahtar kelime FROM, tablo adı ve ifadenin sonunu işaretlemek için bir noktalı virgül:
```
SELECT
    col1 [AS alias1], ..., colN [AS aliasN]  
FROM
    table_name
;
```
## İfade
Şimdi, bir nedenle, aynı verilere dayalı olarak farklı sonuçlara ihtiyacımız olduğunu düşünelim, örneğin, 
yeri belirten sütunlar ekleyin, sıcaklığı Fahrenhayt cinsinden gösterin ve bundan daha soğuk hissedip hissetmediğini tahmin edin.

| Yer | Gün | Saat | Hava Durumu | Fahrenhayt Cinsinden Sıcaklık | Hissedilen Soğukluk | Rüzgar Hızı(m/s) |
| --- | --- | --- | --- | --- | --- | --- |
| London | 1 | 1 | Yağışlı | 57 | Flase | 2 |
| London | 1 | 7 | Yağışlı | 52 | False | 1 |
| ... | ... | ... | ... | ... | ... | ... |
| London | 5 | 19 | Yağışlı | 61 | True | 5 |

```
SELECT
    'London' as yer,
    gun, 
    saat,
    hava_durumu,
    sicaklike*9/5+32 as "Fahrenhayt Cinsinden Sıcaklık",
    hissedilen_soğukluk < sicaklik as "Hissedilen Soğukluk",
    ruzgar_hizi as "Rüzgar Hızı(m/s)"
FROM
    weather
;
```

"Yer", "Fahrenhayt cinsinden sıcaklık" ve "hissedilen soğukluk" nitelikleri için değişmez değerlere ve sütun adlarına göre karşılık gelen ifadeleri belirledik. 
Evet, sütun adlarını ifadelerde de kullanabilirsiniz! 
Veri yönetim sistemi sorgumuzu yürüttüğünde, işlenen her satır için sütun adlarını karşılık gelen öznitelik değeriyle değiştirir.

## mantıksal tablo

Bir veri yönetim sistemi, verilerinizin mantıksal bir tablonun soyut bir kavramının arkasında fiziksel olarak saklanma şeklini gizler. 
Bir sorgu çalıştırabilmek için bilmemiz gereken tek şey veritabanı şeması —tablo adları, sütun adları ve türleri—ve uygun erişim izinleridir. 
Dahili olarak, sorgu işlemcisi sorgulardan dosyalar, ağ bağlantıları ve hatta diğer sorguları yürütmenin sonuçları gibi fiziksel verilere tablo ve 
sütun referanslarını eşler.

Bir tablodan veri çıkaran ve içindeki ifadeleri değerlendiren ifadeler için genel şablona son bir göz atalım: 
- anahtar kelime SELECT, 
- isteğe bağlı takma adlara sahip ifadelerin listesi, 
- anahtar kelime FROM, 
- tablo adı ve 
- ifadenin sonunu işaretlemek için bir noktalı virgül.

```
SELECT
    exp1 [AS alias1], ..., expN [AS aliasN]  
FROM
    table_name
;
```
