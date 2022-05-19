# Veritabanlarına giriş

Bugün dünya bilgiyle aşırı yüklü ve biz de öyle. Önemli bilgileri nasıl güvenli ve düzenli tutuyorsunuz? 
Herhangi bir şeyi unutmamayı veya karıştırmamayı umabilirsiniz, ancak bunu bir yere yazmak veya cihazınıza kaydetmek daha iyidir. 
Yani bilgisayarınızda veya telefonunuzda var olan program, bilgileri güvende tutuyor. Program aktifken her şeyi "hatırlar". 
Ancak, programdan çıkmak tüm bu bilgilerin kaybolmasına neden olabilir. Bu nedenle, verileri daha karmaşık araçlar kullanarak tutmak daha iyidir.

Buradaki zorluk, devasa ve karmaşık bir bilgi ağında gezinmek ve önemli olan her şeyin güvenli ve düzenli olmasını sağlamaktır.

# Veri tabanı

Veritabanı, bir bilgisayar tarafından işlenen hızlı arama ve erişim için özel olarak düzenlenen bir veri topluluğudur.

Bir veritabanı ile normal bir dosya arasındaki fark, bir dosyanın yapılandırılmış veya yapılandırılmamış olabileceği, 
ancak bir veritabanının belirli bir yapıya sahip olması gerektiğidir. 
Örneğin, yapılacaklar listesi içeren bir dosya oluşturabilirsiniz:

![image](https://ucarecdn.com/d0a83903-5f02-4aff-8758-e57938a01901/)

Açıkçası, bu dosyanın bir tür yapısı olduğunu söyleyebiliriz, ancak bilgisayar açısından bakıldığında, 
içindeki verileri yöneten bir program yazana kadar hala düz bir dosyadır. 
Genellikle, veritabanlarındaki bilgiler düz metin yerine, ikili dosyalar olarak sıkıştırılır ve saklanır, 
bu nedenle bu tür bir yapının insanlar için değil bilgisayarlar için olduğu açıktır.

Bizden farklı olarak, bilgisayarlar ikili veri biçimini kolayca anlayabilir, ancak bunları doğru bir şekilde okuyup yazmalarına ne izin verir? 
Veritabanındaki verileri kontrol eden *Veritabanı Yönetim Sistemi* adlı bir programdır.

# Veritabanı Yönetim sistemi

Veritabanı Yönetim Sistemi(DBMS), kullanıcıların verileri tanımlamasına, oluşturmasına ve kontrol etmesine olanak tanıyan bir yazılım türüdür.

DBMS, sorguları optimize edebilir ve veri tabanından optimal bir şekilde veri alabilir. 
Kullanıcı ve veritabanı arasında bir arabulucudur; bu, kullanıcıların VTYS'nin arayüzü aracılığıyla onunla çalışabileceği anlamına gelir. 
Ek olarak, onlardan veri izole etmeye de yardımcı olabilir.

Bu yazılımın bir diğer amacı, insanların gerçek farklılıklarını ortaya çıkarmadan, farklı veritabanlarıyla çalışmasına yardımcı olmaktır.

![gorsel](https://ucarecdn.com/36ac204f-352a-4029-8ee2-9d553112761d/-/crop/2144x920/0,159/-/preview/)

Çoğu veritabanı yönetim sistemi, sitelerinde oldukça iyi açıklamalara ve öğreticilere sahiptir. 
Bununla çalışmaya başlamak için öğrenmeniz gereken belirli diller de vardır, ancak programlama dillerini biliyorsanız, 
bunun yerine araçlarıyla bir veritabanıyla çalışabilirsiniz.

Tüm veritabanlarının farklı sözdizimine sahip gibi görünse de, çoğu aslında ortak standartları uygular. 
Hemen hemen tüm ilişkisel veritabanları SQL standardını kullanır, böylece aynı komutları farklı VTYS'lerde uygulayabilirsiniz.

# Verilere erişim

Bu aşamada, veritabanlarını nasıl kullanacağınız konusunda hala şüpheleriniz olabilir. 
Verileri güncellemek ve seçmek için yeni bir dil öğrenmeniz gerekiyor, bu zaman alıcı olabilir, o halde neden bunun yerine düz dosyaları kullanmıyorsunuz?

Tabii ki, dosyaları yerel olarak tutabilirsiniz, ancak sayıları arttıkça bilgileri hızlı bir şekilde bulamayacaksınız. 
Veritabanları , gerekli verilerin hızlı bir şekilde aranmasını sağlayan şemalar ve meta veriler sağlar.

*Bir şema, verileri nasıl düzenlediğinizi açıklar. Meta veriler, yapısal ve istatistiksel bilgileri tutar.*

Verilerinize birden fazla cihazdan erişmek istiyorsanız, çoğu sistem web üzerinden bunlarla çalışmak için uygun bir yol sağlar.

Başka bir kişiye sınırlı erişim açmak için, bazı yönetim sistemleri basit oturum açma/şifre doğrulaması kullanırken bazıları daha güçlü araçlar sağlar. 
Onların yardımıyla, her kullanıcı için sınırlı bir veri bölümüne erişim izni verebilirsiniz.

![gorsel](https://ucarecdn.com/133f8c65-6edd-49cc-97ec-15d5eb7cdf0d/-/crop/1705x1517/128,93/-/preview/)

DBMS'lerin ne kadar harika olduğuna hala ikna olmadıysanız, onlardan başka neler alabileceğinize bir bakalım.

# Veri tutarlılığı

Veritabanlarının en iyi özelliklerinden biri, verileri doğru bir şekilde tutma ve geri yükleme yetenekleridir. 
Bu, DBMS'nin nasıl doğru olunacağını bildiği anlamına gelmez, ancak kuralları yapılandırma veya şema ile tanımladığınızda, 
hiçbir şeyin bu kuralları bozmayacağından emin olabilirsiniz. 
DBMS, verileriniz için kullanabileceğiniz biçimleri size sağlayabilir. Ayrıca, sahip olmak istediğiniz tüm testleri ve kısıtlamaları da ayarlayabilirsiniz.

Birkaç kişinin aynı verilere aynı anda erişimi varsa, bir sorun olabilir. 
Dosyalardaki güncellemeler genellikle "son kaydetme kazançları" kuralını takip eder ve bu da güncellemeler arasında bir çakışma yaratır. 
Örneğin, biri yapılacaklar listenize katkıda bulunmaya karar verirse, "son değişiklikler kaydedildi" dosya güncelleme kuralına uyarak, 
yarın gece için planladığınız futbol maçını TV'de kaçırma riskini alırsınız. 
Bu arada, veritabanları farklı kullanıcıları izole eder ve güncellemeleri arasındaki çakışmaları çözmek için yapılandırılabilir.

Veritabanları hakkında bir başka iyi şey daha var. Normal bir dosya bozulduğunda ve açılamadığında, verilerinizi sonsuza kadar kaybedersiniz. 
Bunun yerine DBMS'yi kullanarak **yedekleme** yapabilir ve ardından çalışmaya devam etmek için verileri **geri yükleyebilirsiniz.**

Tabii ki, tüm bu işlemleri taklit edebilir ve DBMS'nizi geliştirebilirsiniz, ancak önce mevcut çözümlerle çalışmayı deneyin.

## Çözüm

Veritabanlarıyla çalışmaya başlamadan önce yapmanız gereken çok şey var. Acı yok, kazanç yok ve burada aslında çok şey kazanabilirsiniz.

Veritabanları ile şunları yapabilirsiniz:

- Verileri saklayın, alın ve güncelleyin;
- Meta verileri alın;
- Bir veritabanına uzaktan erişin;
- Verilere erişimi kısıtlamak;
- Eşzamanlı güncellemeler yapın;
- Zaman içinde bir noktaya geri dönün;
- Veri tutarlılığı için kuralları otomatik olarak kontrol edin.

Veriye dayalı bir dünyada bu tür bir işlevsellik altın değerindedir. 
