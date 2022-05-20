# Temel veri türleri

Bildiğiniz gibi SQL, bir tablo halinde düzenlenmiş farklı veri türleri ile çalışmak için kullanılan bir dildir. 
Genellikle, bir tablodaki aynı sütundaki veri değerleri aynı anlama ve türe sahiptir. Örneğin, bir tablo araba şöyle görünebilir:

![gorsel](https://ucarecdn.com/52d3390f-4b7b-447b-9b11-6691d91d97ab/)

Üretim yılı sütunundaki değerlerin tamsayı, fiyattaki değerlerin ondalık ve elektrikteki değerlerin boolean olduğunu görüyoruz. 
SQL veritabanları genellikle bir veritabanı tablosundaki her sütunun bir adı ve bir veri türü olmasını gerektirir. 
Sütun veri türü, sütunda depolanabilecek değerler kümesini kısıtlar ve bunlar üzerinde bir dizi olası işlemi tanımlar.

ANSI standardı, oldukça karmaşık bir veri türleri kümesini tanımlar. Ayrıca, veritabanı satıcıları genellikle kendi standart dışı veri seçeneklerini ekler. 
Bu konuda, veri türlerinin çok temel bir alt kümesini ele alacağız: ```INTEGER```, ```FLOAT```, ```DECIMAL```, ```VARCHAR``` ve ```BOOLEAN```.

# Sayısal veri türleri

```INTEGER```, bir dizi matematiksel tamsayıyı temsil eden sayısal bir veri türüdür(genellikle -2147483648 ile +2147483647 arasındadır.). 
INTEGER türü, sayaçlar, sayısal tanımlayıcılar ve ölçek aralığına uyan hayal edebileceğiniz herhangi bir tamsayı iş değeri için iyidir.

Günlük hayatta, genellikle ondalık sayılarla oldukça fazla karşılaşırız: 
örneğin, vücut ısısını(36.6 santigrat derece) ölçerken veya değerli mali kaynaklarımızı sayarken. 
SQL, bu tür değerler için özel bir veri türünü destekler –> DECIMAL(kesinlik, ölçek).

Bu türün iki parametresi vardır: **kesinlik** ve **ölçek**.

- Ölçek(scale), ondalık noktanın sağındaki basamak sayısıdır.

- Kesinlik(precision), sayıdaki toplam basamak sayısıdır.

![gorsel](https://ucarecdn.com/3531d53e-6392-4a3e-9c2b-ff4000f2e017/)

```FLOAT``` veri türü, kayan noktalı sayılar için kullanılan yaklaşık bir sayısal veri türüdür. FLOAT veri tipi ile çok büyük veya çok küçük sayıları saklayabiliriz. 
Ayrıca hızlı işlem gerektiren hesaplamalar için kullanılır. 
FLOAT veri türü, kesinliği ve depolama boyutunu (1'den 53'e kadar) belirten isteğe bağlı bir n parametresine sahiptir.

Bu arada, bazen SQL'de ```REAL``` veri tipiyle karşılaşabilirsiniz.

## Metin

Elbette, sayısal verilerden başka bir şeyi işlemek isteyebilirsiniz ve SQL, metin verilerini temsil etmek için tasarlanmış bir veri türleri ailesini destekler. 
Bunlardan birini ele alalım, oldukça evrensel ve temel olanı –> ```VARCHAR(n)```.

Bu tür, n'den daha uzun olmayan, değişen uzunlukta bir sembol dizisini temsil eder. 
Örneğin, VARCHAR(4) tipindeki bir sütuna "elma", "erik" dizeleri eklenebilir. 
"portakal" ve "lahana" dizeleri uzunluk kısıtlamasını aşacak ve sistem bu tür uzun değerleri girmeye çalışırsa bunları kesecek veya bir hata üretecektir.

## Boolean

```BOOLEAN``` türü, boolean mantığı(doğruluk) değerlerini temsil eder : TRUE veya FALSE. 

## Türleri kim ve nasıl tanımlar?

Bir veritabanı kullanıcısı olarak, bunları doğru bir şekilde işleyebilmek için kullandığınız tablo sütunlarının türlerini bilmeniz yeterlidir. 
Ancak bir yazılım mühendisi olarak tablo oluşturmayı ve sütun tiplerini tanımlamayı da bilmelisiniz.

5 sütunlu bir "nüfus sayımı" tablosunu tanımlayan bir SQL sorgusu örneğini ele alalım: 
- "id" INTEGER türünde, 
- "name" VARCHAR(20) türünde, 
- "birth_place_latitude" REAL türünde, 
- "year_income" DECIMAL(20,3) türünde,
- "is_parent" BOOLEAN türünden.
```
CREATE TABLE census (
    id INTEGER,
    name VARCHAR(20),
    birth_place_latitude REAL,
    year_income DECIMAL(20,3),
    is_parent BOOLEAN
);
```
Aşağıdaki deseni görebilirsiniz:
```
CREATE TABLE table_name (
    column_name_1 column_type_1,
    ..., 
    column_name_n column_type_n
);
```
Veriler çok çeşitli olabilir ve SQL, bu çeşitliliği temsil etmek için kapsamlı bir veri türleri kümesini destekler. 
