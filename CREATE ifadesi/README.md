
# CREATE ifadesi

Üniversite öğrencileri ile ilgili bilgileri yeni bir veritabanında saklayalım. Bunun için ```CREATE DATABASE``` deyimini kullanabiliriz. 
Veritabanımızın adı öğrenciler olacak :
```
CREATE DATABASE öğrenciler;
```
Bu basit SQL sorgusu veritabanını oluşturacak, ayrıca verileri düzenlemek için birkaç tabloya ihtiyacımız olacak.

# Yeni Tablo Oluşturma

Bir tablo oluşturmak için ```CREATE TABLE``` ifadesini kullanalım.

Öğrenci veritabanımızla çalışmaya devam edelim ve dört sütun içeren bir ```öğrenci_bilgisi``` tablosu oluşturalım: ```öğrenci_kimliği , ad , soyadı ve yaş```.

```Öğrenci_no sütunu```, ```INT``` türünün benzersiz öğrenci tanımlayıcısını tutacaktır. 
Sütun ```adı ve soyadı VARCHAR(30)``` verisine sahip olacaktır. ```Yaş sütunu INT``` değerlerini tutacaktır .
```
CREATE TABLE ogrenci_bilgisi ( 
    ogrenci_no INT, 
    ad VARCHAR(30), 
    soyad VARCHAR(30), 
    yas INT
);
```
Sonuç olarak, öğrenciler_info boş bir tablomuz var :

|ogrenci_no | ad | soyad | yas |
|-----------|----|-------|-----|

# Veritabanı Silme

Bir veritabanını silmek için ```DROP DATABASE``` deyimini kullanabiliriz.

Aşağıdaki SQL sorgusu mevcut veritabanı öğrencilerini bırakır:
```
DROP DATABASE ogrenciler;
```
Veritabanını düşürürseniz, içinde depolanan tüm tabloları kaybedeceğinizi unutmayın.

```DROP DATABASE```, veritabanındaki tüm tabloları ve veritabanının kendisini silecektir. 
Yalnızca **belirli bir tabloyu silmek istiyorsanız**, ```DROP TABLE``` ifadesini kullanın.

Basit bir SQL sorgusu ile ```ogrenci_bilgisi``` tablomuzu silelim :
```
DROP TABLE ogrenci_bilgisi;
```
**DROP DATABASE** deyimi veritabanındaki **tüm tabloları silerken**, **DROP TABLE** deyimi **tablonun kendisini ve içinde depolanan tüm bilgileri** siler.

Yeni bir veritabanı oluşturmak için bu sorgu şablonunu kullanabilirsiniz:
```
CREATE DATABASE veritabani_adi;
```
Veritabanını bırakmak için aşağıdaki şablon kullanılır:
```
DROP DATABASE veritabani_adi; 
```
Yeni bir tablo oluşturmak için şu genel şablonu izleyin:
```
CREATE TABLE tablo_adi ( 
    sutun_1 sutun_1_tip,
    sutun_2 sutun_2_tip,
    ...., 
    sutun_n sutun_n_tip
);
```
Bir tabloyu silmek için şu ifadeyi kullanın:
```
DROP TABLE toblo_adi; 
```
