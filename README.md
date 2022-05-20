# SQL

## SQL nedir?

**SQL (Structured Query Language)**, tablolardaki verileri işlemek için tasarlanmış [etki alanına özgü bir programlama dilidir.](https://www.jetbrains.com/mps/concepts/domain-specific-languages/) 1970'lerde geliştirildi ve bugüne kadar SQL benzeri arayüzler sadece tablolara dayalı değil, veri yönetim sistemlerinde çok popüler!

Bu kadar sık kullanılan bir dili anlamak muhtemelen çok faydalı olacaktır. Bir yazılım mühendisiyseniz, bunu öğrenmek iyidir çünkü birçok sistem, iş verilerini SQL'i destekleyen hizmetler aracılığıyla depolar ve işler. Örneğin, bir sigorta şirketinin bilgi sisteminin arka ucu, müşterileri hakkında veri çıkarmak ve güncellemek için SQL kullanabilir.

İstatistikleri hesaplamak için SQL'i nasıl kullanabileceğinize dair somut bir örneğe bakarak başlayacağız. Ardından SQL ismindeki harflerin ne anlama geldiğini inceleyerek bilgimizi derinleştireceğiz.

## İstatistikleri hesaplama

SQL, verileri toplamayı ve istatistikleri hesaplamayı kolaylaştırır. 1920 ile 2000(200 dahil) arasında Jessie'nin popülaritesindeki değişiklikleri nüfus sayımı verilerine dayanarak değerlendirmeniz gerektiğini varsayalım. SQL kullanarak bu görevi sadece 11 satır kodla tamamlayabilirsiniz! 'Jessie' 1920 ile 2000 yılları arasında kimin doğduğunu belirten kişilerle ilgili kayıtları seçer.

![gorsel](https://ucarecdn.com/0be0f2cd-6f09-4f30-80d0-b7688534e007/)

SQL, dünya çapında, veri odaklı şirketler tarafından kullanılan standart veri işleme dilidir. Başlamak için en iyi yer temel bilgilerdir, bu yüzden şimdi tam olarak neyle uğraştığımızı bulmak için SQL adındaki her harfin ne anlama geldiğine bakalım!

## S Yapılandırma İçin

SQL, tablolar olarak yapılandırılmış verileri çıkarmak ve güncellemek için kullanılan bir dildir. Bu tür veriler, muhasebe verilerini içeren Excel elektronik tabloları veya Google BigQuery'deki nüfus sayımı istatistikleri gibi çeşitli uygulama alanlarında görünür. Başka bir örnek, İlişkisel Veritabanı Yönetim Sistemi(RDBMS) olarak bilinen tabloları tutmak ve bunlara erişmek için özel bir yazılım sistemi kullanan bir çevrimiçi mağazadır. Bunlar, mallar, siparişler ve müşteriler hakkındaki bilgileri işlemeye yardımcı olabilir.

SQL, belirli bir yapıya sahip tablolarla kullanılmak üzere tasarlanmıştır:

![gorsel](https://ucarecdn.com/33e54fe7-c08c-4d0c-acaa-50e8d02ebd65/)

Tablolar satırlar ve sütunlar içerir . Her satır, bir dizi özellik veya niteliğe sahip bir nesne veya varlıktır. Örneğin, üçüncü satır 1985 doğumlu Willie ile ilgili verileri içerir.

Veriler genellikle veritabanı olarak bilinen bir dizi tablo halinde düzenlenir . Daha sonra bu tablolara bireysel adlarını kullanarak erişmek mümkündür. Örneğin, bir çevrimiçi mağazanın veritabanında, Müşteriler adlı bir tablo muhtemelen şirketin müşterileri hakkında genel bilgileri (adları ve iletişim bilgileri) içerecektir. Siparişler tablosu, verdikleri belirli siparişler (müşteri, mallar, ödeme detayları) hakkında bilgi depolar.

## Q Sorgu İçin

SQL, çok sayıda veri işleme özelliğine sahip bir programlama dilidir. Bildirimseldir, yani SQL'de yazılmış bir ifade, sisteme ne yapılması veya nasıl değerlendirilmesi gerektiğini söyleyen ancak nasıl yapılacağını belirtmeyen bir sorgudur.

Sonraki örnekte, ```Census``` tablodaki tüm satırları ve sütunları ayıklar:

```SELECT * FROM Census;```

Tablodaki tüm satırları seçmek için sembol ```*``` kullanılır. Ayrıca, her SQL ifadesini, ifade sonlandırıcı olarak bilinen noktalı virgül(;) ile bitirmek standart bir uygulamadır.

```SELECTSQL``` gibi anahtar kelimeler büyük/küçük harfe duyarlı değildir. Herhangi bir harf durumunda olabilirler. 

*Ancak daha görünür olmaları için genellikle tamamı büyük harflerle yazılırlar.*

## L Dil İçin

Yukarıdaki örnekteki basit sorguyu "nüfus sayımından her şeyi seç" şeklinde okuyabilirsiniz. SQL, doğal bir dile mümkün olduğunca benzer olacak şekilde tasarlanmıştır. Bildirimsel doğası, işlemin karmaşıklıklarını gizlemeye yardımcı olur ve kullanıcının nispeten basit bir şekilde neyin gerekli olduğunu tanımlamasını sağlar. Sistem daha sonra sorguyu analiz eder, kontrol akışını seçer ve yürütür.

SQL ilk olarak 1980'lerde Amerikan Ulusal Standartlar Enstitüsü(ANSI) tarafından bir standart olarak kabul edildi ve yazılım satıcıları tarafından onu destekleyen birçok lehçe uygulandı. Lehçeler ANSI standardını temel alır ancak bazı teknik farklılıkları vardır. Örneğin, tarihleri veya dizeleri aynı şekilde işlemeyebilirler. Bu, farklı lehçelerde yazılmış SQL sorgularının uyumlu olmadığı anlamına gelir. Ancak, SQL'in temellerini öğrendikten sonra, yazılı Amerikan ve İngiliz İngilizcesinde olduğu gibi farklı lehçelere çok kolay uyum sağlamak mümkündür.

SQL, yapılandırılmış verilerle çalışırken kullanılan, etki alanına özgü, *bildirimsel* bir dildir.

Tablolarda düzenlenen verilerle, farklı kriterlere göre satır ve sütun seçmek için SQL sorguları yazabileceğinizi, varlık grupları oluşturabileceğinizi, istatistikleri hesaplayabileceğinizi ve çok daha fazlasını yapabilirsiniz.
