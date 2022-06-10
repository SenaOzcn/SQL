# Sonuç sıralaması

Bir otel rezervasyon hizmeti veri tabanından sorumlu olduğunuzu düşünün. 
Müşteri tarafından belirlenen kriterlere göre oteller hakkında bilgi içeren bir dizi satırı nasıl seçeceğinizi zaten biliyorsunuz. 
Yine de, seçimde birçok otel var, bu yüzden onları fiyat, derecelendirme, diğer nitelikler ve hatta müşteri tarafından talep edilen 
ifadelere göre sıralamanız gerekiyor. Bunun SQL'de nasıl yapılabileceğini görelim.

Verileri sorguladığınızda, SQL, sorgu değerlendirme sonucunda herhangi bir varsayılan satır sırası sağlamaz. 
Ortaya çıkan satırların sırasını belirtmek için sorguda ```ORDER BY``` yan tümcesini kullanmalısınız.

Aşağıdaki örneğe bir göz atalım:

```
SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    price_per_night
;
```

SELECT ifadesinin sonunda ortaya çıkan satırların ```price_per_night``` özniteliğine göre sıralanması gerektiğini belirtmiştik.

Satırları ifadelere göre de sıralayabilirsiniz. Örneğin, aşağıdaki sorguda, erken check-in ile iki gecelik otelleri fiyata göre sıralıyoruz:

```
SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    price_per_night*2 + price_for_early_check_in
;
```

# Artan ve azalan düzen

Sıralama, karşılaştırma operatörünün (<, >) tanımına dayanır. Listede daha büyük veya daha küçük değerlerin daha yükseğe yerleştirilmesi gerektiğini belirtebilir. 
Bir örnek düşünelim:

```
SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    rating DESC
;
```

Burada ORDER BY deyimi ORDER BY[ASC, DESC] içerir;
ORDER BY anahtar sözcüğü, doğru ifade ve isteğe bağlı bir anahtar sözcük; ya ```ASC``` veya ```DESC```, sıranın artan mı yoksa azalan mı olduğunu belirtin. 
Varsayılan olarak, sıranın artan olduğu varsayılır, bu nedenle ASC önceki sorgu örneklerinde anahtar kelimeyi atladık.

# Çoklu ifadeler

Otelleri hem fiyata hem de oylamaya göre sıralayan bir sorgu yazalım:

```
SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    rating DESC,
    price_per_night*2 + price_for_early_check_in 
;
```

ORDER BY yan tümcesinde birden fazla ifade belirtildiğinde, önceki değerlere göre eşit olan satırları sıralamak için sonraki değerler kullanılır. 
Her ifadeyi isteğe bağlı bir ASC veya DESC anahtar sözcüğü takip edebilir. 
Örneğimizde, oteller derecelendirmeye göre(büyükten küçüğe) ve eşit derecelendirmeye sahip olanlar fiyata göre sıralanmalıdır.

# Sözdizimi

Ortaya çıkan satırları bir sonuç niteliğini tanımlayan bir ifadeye göre sıralarsanız, 
bunu ORDER BY yan tümcesinde bir sütun diğer adı veya numarası ile adresleyebilirsiniz. 
Örneğin, aşağıdaki sorguda satırları toplam fiyat ve derecelendirmeye göre sıralarız:

```
SELECT
    hotel_name, 
    price_per_night*2 + price_for_early_check_in AS total_price,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    total_price, 3 DESC
;
```

ORDER BY yan tümcesi, SELECT ifadesinden döndürülen satırları belirtilen ifadelere göre artan veya azalan düzende sıralamanıza olanak tanır.

ORDER BY yan tümce kalıbı aşağıdaki gibidir: 
ORDER BY expr1 [ASC, DESC], ..., exprN [ASC, DESC]; 
ORDER BY anahtar sözcüğü, isteğe bağlı ASC veya DESC anahtar sözcükle ifadelerin listesi (veya bir sorgunun SELECT bölümündeki karşılık gelen takma adlar veya sayılar) .
