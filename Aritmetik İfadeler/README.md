# Aritmetik İfadeler

## Aritmetik

Verilerimiz üzerinde matematiksel hesaplamalar da yapabiliriz.

SQL'de desteklenen temel aritmetik işleçler kümesi aşağıdaki gibidir:
```
-(bir değerin işaretini değiştiren tekli eksi)
SELECT -2;
> -2
*(çarpma), /(bölme), %(tamsayı bölmenin kalanını döndüren mod),
SELECT 20*15;
> 300
SELECT 3/5;
> 0.60
SELECT 18%4;
> 2
+(toplama), -(çıkarma)
SELECT 30+234;
> 264
SELECT 3-5;
> -2
```
SQL, ortak operatör önceliği kurallarını destekler. 
Yukarıdaki listede operatörler önceliğin azalmasına göre sıralanmıştır. 
SQL ayrıca bir operatörün diğerlerine göre öncelikli olmasını sağlamak için *parantezleri* de destekler.

Bir ifadenin doğru değerlendirilmesi için bunlara ihtiyacınız olmasa bile kodun okunabilirliğini artırmak için parantezleri de kullanabilirsiniz. 
Bunları karşılaştırın: 
```
-2+2*2-2/2
(-2)+(2*2)-(2/2)
``` 
İkincisini okumak çok daha kolay!

## Hesap makinesi

SQL'de sadece bir hazır bilgi değil, aynı zamanda bir ifade de seçebilirsiniz. Bir ifadeyi ayıklayan basit bir SQL sorgusu için bir şablon sağlayalım:
```
SELECT ifade;
```
İfade üç bölümden oluşur: anahtar kelime ```SELECT```, değerlendirmek istediğimiz ```ifade```(buraya doğru belirtilen herhangi bir ifadeyi yerleştirebilirsiniz) 
ve sorgunun sonunu tanımlayan bir ```noktalı virgül```.

Örneğin, aşağıdaki kod ```(2+2)*15``` ifadesini değerlendirir.
```
SELECT (2+2)*15;
```
Sorgu değerlendirme sonucu ```60```.
