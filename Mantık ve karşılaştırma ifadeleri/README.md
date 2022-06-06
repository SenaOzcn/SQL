# Mantık ve karşılaştırma ifadeleri

Bir kitapçı veritabanından sorumlu olduğunuzu düşünün. 
Her seçimde çok fazla satır vardır ve bunları belirli kriterlere göre filtrelemeniz gerekir. Bir tablodan bir satır alt kümesinin seçimine **filtreleme** denir.

## Bir kritere göre filtreleme

Seçimi filtrelemek için SQL'de özel bir ```WHERE``` operatörü vardır.

Bu operatörün sözdizimi aşağıdaki gibidir:

```
SELECT *
FROM table
WHERE conditions
```

İlk müşterinizin Charles Dickens'ın bir kitabını almak istediğini düşünelim. Kriterlere uyan kitapları seçen bir sorgu yazalım:

```
SELECT id, title, rating
FROM books
WHERE author = 'Charles Dickens';
```

İfadenin sonuna , filtreleri belirten mantıksal ifadenin ardından bir ```WHERE author = 'Charles Dickens'``` anahtar kelime ekledik.

## Karşılaştırmalarla Filtreleme

| Operatör | Anlamı |
| --- |---|
| = |	eşitlik kontrolü |
| <, > |	daha küçük, daha büyük |
| <=, >=	| küçük eşit, büyük eşit |
| <>, !=	| eşit değil |

Genellikle, sayısal değerlere karşılaştırmalar uygularız. Dize değişmezleri veya tarihlerle bir seçim yapmak istiyorsak, bunları tırnak ("") içine almalıyız.

Aşağıda, karşılaştırmalar kullanılarak tablodan veri çıkarılmasına ilişkin bazı örnekler verilmiştir.

| Ürün Kimliği | Ürün Adı |	Fiyat	| Kategori |
| --- | --- | --- | --- |
| 1 |	Süt	| 70	| günlük |
| 2	 | Peynir |	500 |	günlük |
| 3	| Tavuk |	250	| et |
| 4 |	Domuz eti |	350 |	et |
| 5 |	Patates |	40 |	sebzeler |
| 6 |	Domates |	150 |	sebzeler |

Bu sefer ```>``` operatörü kullanıyoruz. Sorgu şuna benziyor: Diyelim ki tablomuzdaki hangi ürünlerin fiyatının 250'den fazla olduğunu bilmek istiyoruz.

```
SELECT *
FROM ürünler
WHERE fiyat > 250
```
Aşağıda, istenen öğeleri içeren tablomuzun nasıl göründüğünü görebiliriz:

| Ürün Kimliği | Ürün Adı |	Fiyat |	Kategori |
| --- | --- | --- | --- |
| 2	| Peynir |	500	| günlük |
| 4 |	Domuz eti |	350 |	et |

Oldukça basit, değil mi?

250'den fazla veya ona eşit olan öğeleri seçmek istiyorsak, ```>=``` kullanmalıyız. Bizim için anlaşılır olduğundan emin olmak için bir örnek daha inceleyelim.

Bu sefer tablodan sebzeler kategori ile ilgili tüm ürünleri seçmek istiyoruz. SQL sorgumuz şöyle görünecek:

```
SELECT *
FROM ürünler
WHERE Kategori = 'sebzeler'
```

Bir dize değişmeziyle bir seçim yaptığımızda tırnak işaretlerinin gerekli olduğuna dikkat edin. Bunları unutursanız, sorgu çalışmaz.

Seçimimizin sonucu doğru görünüyor:

| Ürün Kimliği |	Ürün Adı	| Fiyat |	Kategori |
| --- | --- | --- | --- |
| 5 |	Patates |	40	| sebzeler |
| 6 |	Domates	| 150	| sebzeler |

## Mantıksal ifadeler 

Zaten aşina olduğunuz ```boolean``` cebirinden üç operatör:

- **NOT True** argüman eşittir değil ise **False** döner.
- **AND** işlenenleri karşılaştırır ve *tümü* **True** ise **True** döner. Aksi takdirde **False** döner.
- **OR** işlenenlerden *en az biri* **True** ise **True** döner. Aksi takdirde **False** döner.

Lütfen önceliklerine göre sıralandıkları için yukarıda verilen *operatörlerin sırasına dikkat edin.*

Aşağıdaki resim, yukarıda bahsedilen işlenenlerin mantığını göstermektedir:

![gorsel](https://ucarecdn.com/7fc47bb7-e415-41c0-87a0-4449f208cd9b/)

Şimdi birkaç örnek daha inceleyelim.

Aşağıda şirketimizde çalışan programcılar hakkında bilgi içeren bir tablomuz var. 
Bir sonraki projemiz için uygun olanlardan bir seçim yapmak istediğimizi hayal edin.

| Kişi_kimliği | İsim |	Durum	 | Beceriler | KPI |
| --- | --- | --- | --- | --- |
| 1 |	Serdar |	Orta |	SQL |	80 |
| 2 |	Sena |	Kıdemli	| SQL |	90 |
| 3 |	Ahmet |	Orta |	pyhton | 70 |
| 4	| Rıdvan |	yeni başlayan |	Java |	60 |
| 5	| Sezen |	yeni başlayan |	SQL |	50 |
| 6 |	Hülya |	Orta	| SQL	| 70 |

Proje için doğru kişiyi işe almak için iki gereksinimi karşılayan bir adaya ihtiyacımız var: Orta veya Kıdemli olmak ve SQL bilmek.

Sorgumuz şöyle görünmelidir:

```
SELECT *
FROM çalışanlar
WHERE (Durum="Orta" OR Durum="Kıdemli") AND Beceriler="SQL"
```

Lütfen işlenenle birlikte kullandığımız parantezlere dikkat edin. Parantez, OR koşulunun önceliklendirilmesi için önemli bir araçtır. 
Parantez kullanmazsak , SQL önce AND işleneni işler ve ancak o zaman OR sorgu isteğini önemsiz hale getirir.

Aynı ölçüt seçimini OR işlenen yerine NOT şekilde düzenleyebiliriz:

```
SELECT *
FROM çalışanlar
WHERE NOT(durum="yeni başlayan") AND Beceriler="SQL"
```

Proje için aday seçimlerimiz aşağıdaki gibi olacaktır:

| Kişi_kimliği | İsim |	Durum |	Beceriler |	KPI |
| --- | --- | --- | --- | --- |
| 1	| Serdar | Orta	| SQL	| 80 |
| 2	| Sena	| Kıdemli	| SQL	| 90 |
| 6	| Hülya	| Orta	| SQL	| 70 |

Şimdi bu üç şanslı kişiye teklif gönderebiliriz ve onlardan biri olmak için SQL becerilerinizde ustalaşmaya devam etmelisiniz.
