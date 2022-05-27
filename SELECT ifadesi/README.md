# SELECT ifadesi

## Tuple

Bir SELECT deyiminde, virgülle ayırarak birden fazla değer belirtebilirsiniz. 
Örneğin, aşağıdaki sorgu bir dize değişmezi, bir sayısal değişmez değer ve bir aritmetik ifade seçer:
```
SELECT 'Alice', 170, 170*0.393701;
```
Böyle bir değer kümesine (veya nitelikler) **tuple** (kayıt, satır) adı verilir.

## Alias

Bir sorguda, bir demetin her özniteliği için bir ad **(takma ad)** belirtebilirsiniz. 
Bunu yapmak için, ```AS``` anahtar sözcüğünü ve ardından değer için bir ad kullanmalısınız. 
Öznitelik takma adı birkaç sözcükten oluşuyorsa veya bir SQL anahtar sözcüğüyle eşleşiyorsa, *çift tırnak içinde belirtilmelidir.* 
Aşağıdaki sorgu, takma adların uygulanmasını göstermektedir:
```
SELECT 
  'Alice' AS name, 
  170 AS height_in_centimeters, 
  170*0.393701 AS "height in inches"
;
```
Sorgu değerlendirme sonucu, "name", "santimetre cinsinden yükseklik" ve "inç cinsinden yükseklik" olmak üzere üç özniteliğe sahip bir tanımlama grubudur.
İnsan tarafından okunabilen takma adlar belirtmek iyi bir fikirdir; alternatif olarak, veri yönetim sisteminiz sizin için bazılarını üretebilir.

Hatırladığınız gibi SQL, tablolarda düzenlenen verileri işlemek için tasarlanmıştır. 
Aslında, örnek sorgunun sonucu da takma adlarda belirtilen ve yalnızca bir satırdan oluşan sütun adlarına sahip bir tablodur.

## Kod okunabilirliği

SQL büyük/küçük harfe duyarlı değildir(anahtar kelimeler her durumda yazılabilir), bu nedenle SELECT, select, SeLeCt ve select hepsi geçerlidir. 
Ancak, onları vurgulamak ve kodun okunabilirliğini artırmak için anahtar kelimeleri *büyük harflerle yazmak en yaygın yöntemdir.*

Çizgiyi görsel olarak ayırmak için biraz boş alan bırakan girintiyi kullanmanız da önerilir. 
Farklı kod stili kılavuzları vardır: 
- sezginizi kullanın, 
- ekibinizin tercihlerini takip edin.

Aynı sorgunun aşağıdaki biçimlendirme seçeneklerini karşılaştırın. Hangisini okumayı tercih edersin?
```
SELECT 'Bob' AS name, 160 AS "height in centimeters", 160*0.393701 AS "height in inches";
```
```
SELECT 
  'Bob' AS "name", 
  160 AS "height in centimeters", 
  160*0.393701 AS "height in inches"
;
```
```
SELECT 
  'Bob'        AS "name", 
  160          AS "height in centimeters", 
  160*0.393701 AS "height in inches"
;
```
Üçüncü versiyon çok daha iyi: niteliklerin sayısını, değerlerini ve adlarını kolayca görebilirsiniz. 
Ortadaki sürüm, kod okunabilirliği açısından orta düzeydedir, 
ancak düzenlemesi üçüncü sürümden daha kolaydır(boşluklarla manuel girinti, kod her değiştirildiğinde bozulur). 
Elbette pratikte ekibinizin tercih ettiği kod biçimlendirme stilini seçebilirsiniz.

İşte temel bir SELECT ifadesi için bir şablon: 
- SELECT anahtar sözcüğü, 
- bunlar için isteğe bağlı takma adlarla çıkarılacak değerlerin bir listesi ve 
- ifadenin sonunu belirtmek için bir noktalı virgül:
```
SELECT val1 [AS name1], ..., valN [AS nameN];
```
