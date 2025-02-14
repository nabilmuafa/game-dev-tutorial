# Tutorial 2

### Apa saja pesan log yang dicetak pada panel **Output**?

Ketika playtest baru dijalankan, terdapat pesan "Platform initialized". Ketika objek pesawat hampir menyentuh batas area atas, terdapat pesan "Reached objective!".

### Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel **Output**?

Ketika menggerakkan landasan ke batas area bawah, tidak ada pesan apa-apa yang dicetak. Namun, ketika kembali menggerakkan landasan ke atas hingga hampir menyentuh batas atas, pesan "Reached objective!" kembali dicetak.

### Buka scene `MainLevel` dengan tampilan workspace 2D. Apakah lokasi scene `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel **Output** pada percobaan sebelumnya?

Ya, ada kaitannya. `ObjectiveArea`, sesuai namanya, merupakan suatu area yang menjadi objective untuk diraih pada game. Area ini terletak di dekat batas atas. Ketika area ini sudah diraih oleh pemain (dalam hal ini, ketika player menggerakkan landasan ke dekat batas area atas), artinya objective sudah tercapai, dan pesan "Reached objective!" akan dicetak di panel Output.

Lebih lanjut lagi, scene `ObjectiveArea` memiliki node `CollisionShape2D`. Berdasarkan dokumentasi Godot, `CollisionShape2D` adalah node yang memberikan suatu `Shape2D` ke parent object `CollisionObject2D`, yang memungkinkan developer untuk membuat suatu area deteksi yang memiliki bentuk dalam bidang `Area2D`. Setelah melihat lebih lanjut ke scriptnya, scene `ObjectiveArea` akan mencetak pesan "Reached objective!" di output apabila objek `BlueShip` yang berada di atas platform mencapai `ObjectiveArea`. Hal ini cukup menjelaskan kenapa pesan "Reached objective!" tercetak ketika platform digerakkan mendekati batas atas game.

### Scene `BlueShip` dan `StonePlatform` sama-sama memiliki sebuah _child node_ bertipe `Sprite`. Apa fungsi dari node bertipe `Sprite`?

Mengacu kepada dokumentasi Godot, `Sprite` atau `Sprite2D` merupakan node yang menampilkan sebuah tekstur 2D. Tekstur yang ditampilkan bisa berupa bagian dari _atlas texture_ yang lebih besar, atau bisa berupa frame dari _sprite sheet animation_. Dapat dikatakan bahwa node ini digunakan untuk mengambil asset yang tersedia pada source files proyek Godot untuk ditampilkan pada suatu Scene yang memiliki node tersebut.

### Root node dari scene `BlueShip` dan `StonePlatform` menggunakan tipe yang berbeda. `BlueShip` menggunakan tipe `RigidBody2D`, sedangkan `StonePlatform` menggunakan tipe `StaticBody2D`. Apa perbedaan dari masing-masing tipe node?

`RigidBody2D` adalah node yang berupa 2D physics body yang bersifat tidak bisa dikontrol secara langsung, melainkan hanya bisa dikontrol menggunakan _external physics forces_ seperti gravitasi, tabrakan, dan lain-lainnya. Body tersebut akan mengkalkulasikan respon _force_ tersebut yang menghasilkan pergerakan, rotasi, dan gerakan fisik lainnya. Sementara itu, `StaticBody2D` adalah node yang berupa 2D physics body yang bisa dikontrol secara langsung oleh pemain, tetapi tidak bisa digerakkan oleh _external forces_. Oleh karena itu, apabila node `StaticBody2D` "ditabrakkan" oleh node lain, `StaticBody2D` tidak akan tergerak dan akan diam di tempat, kecuali digerakkan secara manual oleh pemain.

### Ubah nilai atribut `Mass` pada tipe `RigidBody2D` secara bebas di scene `BlueShip`, lalu coba jalankan scene `MainLevel`. Apa yang terjadi?

Tidak ada yang berubah. `BlueShip` tetap dirasa memiliki berat yang sama, karena ketika platform digerakkan turun dari atas, kecepatan `BlueShip` jatuh ke platform sama saja seperti ketika `Mass`-nya 1kg.

### Ubah nilai atribut `Disabled` pada tipe `CollisionShape2D` di scene `StonePlatform`, lalu coba jalankan scene `MainLevel`. Apa yang terjadi?

Pesawat langsung jatuh ke bawah menembus platform. Hal ini terjadi karena node berupa shape yang mendefinisikan collision pada platform dinonaktifkan, sehingga seolah-olah `StonePlatform` tidak memiliki properti _physics_ dan hanya berupa background.

### Pada scene `MainLevel`, coba manipulasi atribut `Position`, `Rotation`, dan `Scale` milik node `BlueShip` secara bebas. Apa yang terjadi pada visualisasi `BlueShip` di Viewport?

Di contoh ini, saya mencoba mengubah atribut `Rotation`. Di Viewport, `BlueShip` jadi diputar sesuai ke arah yang saya tentukan pada atribut `Rotation` (dalam hal ini jadi menghadap kiri), dan hal ini juga ter-apply ketika melakukan playtesting. Perubahan atribut lainnya juga seperti skala dan posisi juga sama-sama mempengaruhi visualisasi `BlueShip`. Akan tetapi, perubahan skala tidak bisa diaplikasikan ke playtesting karena _physics engine_ Godot akan meng-override perubahan tersebut, kecuali perubahan skala dilakukan pada node collision.

### Pada scene `MainLevel`, perhatikan nilai atribut `Position` node `PlatformBlue`, `StonePlatform`, dan `StonePlatform2`. Mengapa nilai `Position` node `StonePlatform` dan `StonePlatform2` tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?

Hal ini terjadi karena atribut `Position` dari `StonePlatform` dan `StonePlatform2` merupakan posisi relatif terhadap scene yang merupakan _parent_-nya, yaitu `PlatformBlue`. Apabila kita lihat atribut `Position` dari `PlatformBlue`, scene ini berada pada posisi yang tepat antara di Inspector dan di visualisasinya. `StonePlatform` yang merupakan _child_-nya berada di posisi (0,0) relatif terhadap `PlatformBlue` (artinya, berada di posisi yang tepat sama dengan `PlatformBlue`), dan `StonePlatform2` berada di posisi (70, 0) relatif terhadap `PlatformBlue`, yang artinya posisinya sama dengan posisi `PlatformBlue` namun digeser ke kanan (koordinat x) sebanyak 70 satuan. Hal ini dilakukan untuk membuat `StonePlatform` bersebelahan.
