# İlişkisel Veri Modeli

İlişkisel Veri Modeli(RDM), modern veritabanlarının tasarlanmasına dayanan soyut bir matematiksel modeldir. 
İşte birkaç ilişkisel VTYS'nin listesi: 
- Postgres, 
- MySQL, 
- Oracle, vb. 

RDM hakkında bilgi sahibi olmak, modern veritabanları oluşturma kavramını daha iyi anlamanıza ve bilgi sistemlerini yetkin bir şekilde tasarlamanıza yardımcı olacaktır. RDM'nin ana bileşenlerini keşfedelim.

## Önemli terimler

Bazı tanımlarla başlayalım. RDM, ilişki kavramına dayanmaktadır. Bir ilişki, bazı varlıkları veya ilişkileri temsil eden **iki boyutlu bir tablodur.**

Bir varlık, örneğin bir öğrenci, bir araba, bir bina gibi bazı nesnelerin(OOP'deki bir sınıf gibi) bir soyutlamasıdır. 
Bir ilişki, varlıkların nasıl birbirine bağlı olduğunu tanımlar. Örneğin, her öğrenci gruplardan birinde çalışır. 
İlişkisel DB'de böyle bir ilişkiye *çoktan bire ilişki* denir.

Bir ilişki, niteliklerden ve demetlerden oluşur. Nitelik, bir tablodaki bazı özellikleri arasında bir ilişki bulunan bir sütundur. 
Örneğin, bir öğrenciyle ilgili olarak şu nitelikler vardır: 
- soyadı, 
- adı, 
- doğum tarihi ve 
- öğrenci numarası. 

Tuple, bir tablodaki bir satırdır, belirli nitelik değerleri koleksiyonudur.

Nitelikleri ile bir ilişki kısaca şu şekilde ifade edilebilir: 

| öğrenci Numarası	| soyadı | adı	| doğum tarihi |
|-------------------|--------|-------|-------------|
|88881111	| Jackson |	John |	01.01.2000 |

## Kısıtlamalar

İlişkisel veri modelindeki ilişkilere aşağıdaki kısıtlamalar uygulanır:

- Bir veritabanında aynı isimde iki ilişki olamaz.
- Aynı ilişki içindeki tüm öznitelikler farklı adlara sahip olmalıdır.
- Her hücrede yalnızca bir değer olmalıdır.
- İlişkilerdeki satır ve sütunların sırası önemli değildir.

## Varlık bütünlüğü

Bütünlük, bir veri modelinin belirli kurallara uygunluğudur. İki tür bütünlük vardır: 
1. varlık bütünlüğü
2. başvuru bütünlüğü

Varlığın bütünlüğü, tabloda iki özdeş tuple(satır) olamayacağı anlamına gelir. 
Gerçek dünyada olduğu gibi, kesinlikle aynı iki nesneye sahip olamayız, 
örneğin, özdeş öğrenci yoktur, hepsi farklıdır. Bir varlığın bütünlüğünü korumak için birincil anahtar(PK) kavramı tanıtıldı.

![gorsel](https://ucarecdn.com/f7794054-c2bb-4154-86e6-7c15638513f0/)

Örneğin, iki tablo arasında Öğrenci ve Grup ilişkisini ele alalım : 

### Öğrenci

| Öğrenci Numarası (PK) | Soyadı | Adı | Doğum Tarihi | Grup Numarası(FK) |
|-----------------------|--------|-----|--------------|-------------------|
| 88881111 | Jakson | John | 01.01.2000 | 123|
| 88881122 | Peterson | James | 05.06.2001 | 123 |
| 88881177 | Depp | John | 15.03.1995 | 199 |

### Grup

| Grup Numarası(PK) | Fatura Tarihi | Fakülte |
|----|----|----|
| 123 | 12.04.2019 | Ekonomi |
| 199 | 11.07.2020 | Matematik |

Bir öğrenciyle ilgili şu kaydı eklemek istersek ne olur?

```88881188```, ```Madison```, ```Peter```, ```01.02.2002```,```132``` 

Eşitlerin olduğu bir grubumuz olmadığı için, 132 bilgi bütünlüğü ihlaline neden olur.

## Bilgi tutarlılığı

Referans bütünlüğü, birbirine bağlı iki ilişkimiz olduğunda ortaya çıkar. İlişkilerin ilişkisi bir yabancı anahtar(FK) kullanılarak sağlanır. 
Yabancı anahtar, başka bir ilişkinin birincil anahtarına işaret eden bir ilişkinin (alt/bağımlı) niteliğidir. 
Bilgi bütünlüğü, alt tabloda ana tabloda var olmayan bir tanımlama grubuna işaret eden bir yabancı anahtar olamayacağı anlamına gelir.

Örneğin, ele aldığımız örnekte iki ilişki vardır: 
1. öğrenci
2. grup 

Grubun birincil anahtar olan bir öznitelik numarası vardır ve öğrenci ilişkisi, öğrencinin belirli bir gruba ait olduğunu gösteren aynı özniteliğe sahiptir. 
Öğrenci ilişkisinde grup numarası, yabancı anahtardır. Öğrenci tablosunda bir grup için yabancı anahtarın değeri, 
grup tablosunda olmayan bir grubun grubunu işaret ediyorsa, referans bütünlüğünün ihlali olacaktır.

### Öğrenci

| Öğrenci Numarası	| Soyadı | Adı | Doğum Tarihi |	Grup Numarası |
|-----|----|---|---|---|
| 88881111 |	Jackson |	John |	01.01.2000 |	123 |
| 88881122 |	Peterson |	James |	05.06.2001 |	123 |
| 88881177 |	Depp |	John |	15.03.1995 |	199 |

### Grup

| Grup Numarası |	Fatura Tarihi |
|---|---|
| 123 |	12.04.2019 |
| 199 |	11.07.2020 |

FK, çoktan bire, bir ilişki oluşturmak için kullanılır.

## İlişkiler

- **bire bir (1-1) ilişki**, birinci ilişkinin bir demetinin başka bir ilişkinin birden fazla demetiyle ilişkilendirilemeyeceği anlamına gelir. 
Bunun tersi de doğrudur. Örneğin, pasaport - vatandaş (bir kişinin yalnızca bir pasaportu olabilir ve pasaport bir kişiye atıfta bulunur).
- **birden-çoğa (1-M) ilişki**, birinci ilişkinin bir demetinin ikinci ilişkinin bir veya daha fazla demeti ile ilişkilendirilebileceği, 
ancak bunun tersinin doğru olmadığı anlamına gelir. İkinci ilişkinin herhangi bir demeti, birinci ilişkinin yalnızca bir demeti ile ilişkilendirilebilir. 
Örneğin, öğrenci — grup (bir grupta çok sayıda öğrenci olabilir, ancak her öğrenci yalnızca bir gruba aittir).
- **çoktan çoğa (M-M) ilişkisi**, birinci ilişkinin herhangi bir demetinin başka bir ilişkinin bir veya daha fazla demeti ile ilişkilendirilebileceği anlamına gelir. 
Bunun tersi de doğrudur. Örneğin, öğrenci — disiplin (her öğrenci birçok disiplini inceler, her disiplin birçok öğrenci tarafından incelenebilir).

Tanımlayıcı olmayan bir ilişkide, yabancı anahtar ilişkisi, örneğin yukarıda tartışılan Öğrenci-Grup ilişkisi gibi birincil anahtara GİRMEZ.

## Lehte ve aleyhte olanlar

RDM'nin bu kadar popüler olmasının ana nedenlerinden biri, verilerle kolayca etkileşime girebileceğiniz bir SQL sorgu dilinin olmasıdır. 
Diğer bir neden ise, küme teorisine dayalı bir matematiksel aygıta dayanmasıdır. 
Büyük veri hacmi için, diğer (genellikle daha basit ve daha az genel) veri modellerine dayanan VTYS uygulamaları, 
ilişkisel VTYS'den daha ölçeklenebilir ve performans gösterebilir. 
İlişkisel veri modelinin diğer bir dezavantajı, nesne veri modelinden farklı olması ve kod karmaşıklığını artıran bir çeviri katmanı gerektirmesidir.

Özetlemek gerekirse, ilişkisel veri modeli, çoğu modern VTYS'nin altında yatan oldukça karmaşık ve genel bir kavramdır.
