# Değişmezler

Hemen hemen her programda veya veri analizi betiğinde, değişmezler adı verilen **sabit değerlerle** çalışmanız gerekir. 
Örneğin, nüfus sayımı verilerini analiz ediyorsanız ve belirli ölçütlere göre sayım satırlarını çıkarmanız gerekiyorsa, 
genellikle değişmez değerler kullanmanız gerekir.

Bu konuda, üç temel sabit bilgi türünü tartışacağız: ```sayısal```, ```dize``` ve ```boolean```. 
Bu yeni edinilen bilgiyi hemen uygulamak için bir "Merhaba dünya!" programı yazacağız.

## Dize değişmezleri(String)

SQL'de bir dize sabiti, tek (') veya çift (") tırnak içine alınmış bir karakter dizisidir, 
örneğin, 'Merhaba dünya!' ve "SQL (Yapılandırılmış Sorgu Dili)".

Tek tırnak içine alınmış bir dize değişmezi içine tek tırnaklı bir karakter eklemek için, iki bitişik tek tırnak yazın, örneğin, 
'Arda"nın doğum günü'. 
Alternatif olarak, tek bir alıntının normal bir sembol olarak değerlendirilmesi için değişmezi çift tırnak içine alın. Örneğin, "Sophie'nin seçimi".

## Sayısal değişmezler(INTEGER, DECIMAL, REAL)

Sayısal değişmezler, *tamsayı integer*(1, +9000, -256), *ondalık decimal*(2.3, +876.234, -1024.0) veya üstel gösterimde *gerçek real* değerler
(0.4e3, +7.192834e+10, -4.0e-5) olarak belirtilen pozitif veya negatif sayılar olabilir. İşareti belirtmezseniz, varsayılan olarak pozitif bir sayı varsayılır.

Sayısal değişmezler ```INTEGER```, ```REAL``` ve ```DECIMAL``` olabilir; 
veri yönetim sistemi, türünü bağlama göre otomatik olarak tanımlar. 
Örneğin, INTEGER değer aralığına uyan ondalık noktası olmayan sayısal bir değer belirtirseniz, sistem bunu INTEGER, 
aksi takdirde DECIMAL olarak değerlendirir. Üstel gösterimde belirtilen sayısal değerler REAL veri olarak kabul edilir.

**CAST(value AS type)** işlevini kullanarak bir hazır bilgi türünü doğrudan belirtebilirsiniz. 
Yer tutucu değeri ve türü yerine, değişmez değerinizi ve türünüzü kullanabilirsiniz.
```
SELECT
    CAST(1 AS DECIMAL(20,3));
```
Yukarıdaki örnekte sayısal 1, sorgu sonucunda DECIMAL(20,3) ve 1.000 olarak yorumlanır.

## Boolean değişmezleri

Boolean değişmezleri, boolean mantığı doğruluk değerleridir: TRUE(true) ve FALSE(false). 
Değeri nasıl belirtirseniz belirtin(TRUE veya true), bu değerler aynı boolean değişmez değerleridir(aynısı FALSE değerleri için de geçerlidir).

## Hello, World!

Artık geleneksel bir "Hello, World!!" programı yazmaya hazırız. Bu SQL kodu(aslında tek bir sorgu) onu uygular:
```
SELECT 'Hello, World!';
```
Sorgu değerlendirme sonucu aşağıdaki gibidir:
```
Selam Dünya!
```
Aslında sorgu, sonuç olarak bu dizeyi seçmek istediğimizi bildirimsel olarak belirtir. 
İfade 3 bölümden oluşur: ```SELECT``` anahtar sözcüğü (büyük/küçük harf duyarsız), almak istediğimiz ```değişmez değer``` ve 
sorgunun sonunu tanımlayan ```noktalı virgül```.

Özetlemek gerekirse, dize, sayısal veya boolean herhangi bir değişmez değeri çıkaran basit bir SQL sorgusu aşağıdaki gibi görünür:
```
SELECT değişmez;
```

- Sayısal değişmezler, pozitif veya negatif sayılar olarak belirtilebilir. 
- Ayrıca, üstel gösterimde tamsayılar, ondalık sayılar veya gerçek değerler olarak belirtilebilirler. 
- Dize değişmezleri, tek veya çift tırnak içine alınmış karakterlerdir. 
- Boolean değişmez değerleri, boolean mantığı doğruluk değerleridir: ```TRUE``` ve ```FALSE```.
