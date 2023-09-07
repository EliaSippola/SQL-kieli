SQL-kielen Tehtävä
===
Tietokannan luominen ja muokkaaminen SQL-kielellä CLI (*Command Line Interface*) -päätteessä

*Tehtävässä käytetään XAMPP-ympäristöä joka on ilmainen. Voit asentaa sen [tästä](https://www.apachefriends.org/download.html)*<br>
*Älä käytä tähän tehtävään XAMPP:in omaa visuaalista SQL-ympäristöä, vaan toteuta tehtävä kokonaan terminaalissa*

*Käytä tehtävään apuna [README.md](README.md) -tiedostoa ja [w3schoolin nettisivuja](https://www.w3schools.com/sql/default.asp).*

*Tehtävässä on apuna vihjeitä, ja vastauksia. Pyri tekemään tehtävä ilman vihjeitä niin pitkälle kuin pystyt*

## 1 CLI -päätteen avaaminen terminaalissa

### 1.1 Avaa CMD, ja siirry polkuun `\xampp\mysql\bin`<br>
XAMPP on useimmiten asennettu aseman `C:` juureen

> <details>
> <summary>Vihje 1</summary>
> <br>
>
> Käytä komentoa `cd` siirtyäksesi kansioon `c:\xampp\mysql\bin`
>
> Komennolla `cd ..` voi liikkua taaksepäin kansioissa
>
> </details>
<br>

**Terminaalin polun tulisi nyt näyttää tältä:**<br>

![xampp-kansion polku](assets/images/xampp-kansio.png)

><details>
><summary>Koodi</summary>
><br>
>
>```powershell
>cd C:\xampp\mysql\bin
>```
>
></details>
<br>

*huom, XAMPP saattaa olla asennettuna toiseen tiedostosijaintiin*

### 1.2 Käynnistä yhteys SQL-palvelimeen komentokehoitteesta.

Käytä sovellusta mysql.exe yhteyden muodostamiseen

><details>
><summary>Vihje 1</summary>
><br>
>
> mysql.exe -sovellus tarvitsee parametrin `-u` (`--user`), ja tarvittaessa myös `-p` (`--password`)
>
></details>
<br>

><details>
><summary>Vihje 2</summary>
><br>
>
> käytä käyttäjää `root` kun kirjaudut sisään SQL-palvelimelle
>
> `root` -käyttäjälle ei ole oletuksena asetettu salasanaa
>
> *huom, jos `root` -käyttäjä ei toimi, voi olla että joku on asettanut käyttäjälle salasanan, tai käyttäjä on poistettu käytöstä*
>
></details>
<br>

**Terminaalin pitäisi nyt avautua CLI-päätteeseen:**

![CLI-pääte](assets/images/mariadb-default.png)

><details>
><summary>Koodi</summary>
><br>
>
> ```powershell
> mysql.exe -u root
> ```
>
></details>
<br>

## 2 Tietokannan ja käyttäjän luominen

### 2.1 Luodaan uusi tietokanta nimellä `uusi_db`

*jos tietokanta on jo olemassa, keksi teitokannalle uusi nimi*

><details>
><summary>Vihje 1</summary>
><br>
>
> Käytä komentoa `CREATE DATABASE`
>
></details>
<br>

**Käytetään komentoa `SHOW DATABASES;`, ja tarkistetaan että tietokannan luonti onnistui:**

![tietokanta luotu onnistuneesti](assets/images/tietokanta-luotu-onnistuneesti.png)

><details>
><summary>Koodi</summary>
><br>
>
> ```SQL
> CREATE DATABASE uusi_db;
> ```
>
></details>
<br>

### 2.2 Asetetaan tietokannan merkistö

Käytä komentoa:
```SQL
ALTER DATABASE <tietokanta> <parametrit>;
```

merkistöä muutetaan parametreilla `CHARACTER SET` ja `COLLATE`

Käytä `utf8mb4` -merkistöä, ja aseta järjestykseksi ruotsi (swedish)

><details>
><summary>Vihje 1</summary>
><br>
>
> järjestyksen parametri on `utf8mb4_swedish_ci`
>
></details>
<br>

><details>
><summary>Vihje 2</summary>
><br>
>
> Parametrejen muoto on
> ```SQL
> ... CHARACTER SET <parametri> COLLATE <parametri>;
> ```
>
></details>
<br>

><details>
><summary>Koodi</summary>
><br>
>
> ```SQL
> ALTER DATABASE uusi_db CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_swedish_ci';
> ```
>
></details>
<br>

Voit tarkistaa tietokannan käyttämän merkistön komennoilla:
```SQL
-- USE <tietokanta>;
USE uusi_db;

SELECT @@character_set_database, @@collation_database;
```
![merkistön tarkistus](assets/images/merkiston-tarkistus.png)




><details>
><summary></summary>
><br>
></details>
<br>

-kuvia tietokannan GUI:sta<br>
-käyttäjän tekeminen

