# SQL-kieli


### Mikä on SQL-kieli

- SQL on stantardisoitu kieli viestimiseen tietokannan kanssa
- SQL on lyhennelmä sanoista "Structured Query Language", se tarkoittaa suomeksi Jäsenneltyä kyselykieltä
- Suurin osa nykyisistä tietokantapalvelimista tukee tietokantojen ja tiedon hallintaa SQL kielellä
<br>


### Mihin SQL-kieltä käytetään?

- SQL:ää käytetään tietokantojen hallinnointiin suoraan CLI-päätteestä (Command Line Interface), tai koodista.
- Sen avulla voidaan sekä hallinnoida tietokantoja, käyttäjiä ja niiden oikeuksia, että hakea, lisätä, muokata ja poistaa tietokantojen taulukoita ja tietueita.
<br>

## SQL-kielen käyttäminen komentokehoitteessa

*Tämä ohje koskee SQL-kielen käyttämistä XAMPP -ympäristössä. Toimintatavat ja komennot saattavat olla erilaisia muissa ympäristöissä*

SQL-kielen CLI (command line interface) vaatii yhteyden SQL-palvelimelle. XAMPP -ympäristössä palvelin toimii paikallisesti, joten siihen yhdistäminen on helppoa.

1. Varmista että MySQL -moduuli on käynnissä

2. Avaa komentokehoite hakemalla sovellusta "cmd" windowsin hausta
- voit käyttää myös VSCoden terminaalia, tai esimerkiksi PowerShelliä. Tämän ohjeen komennot on toteutettu windowsin CDM.exe sovelluksessa, joten komentojen syntaksi saattaa olla erilainen

3. käytä komentoa cd siirtyäksesi polkuun `c:\xampp\mysql\bin`
- komennon syntaksi on `cd <polku | kansio>`
- XAMPP -ohjelma asentuu yleensä C:n juureen. Tällöin komento on `cd c:\xampp\mysql\bin`
- pääset levyn juureen komennolla `cd /`
- voit siirtyä taaksepäin komennolla `cd ..`

4. avaa SQL -pääte sovelluksella `mysql.exe`
- kirjoita komento `mysql.exe -u root`
- jos olet asettanut "root" käyttäjälle salasanan, käytä komentoa <br>
  `mysql.exe -u <käyttäjänimi> -p`<br>
  tällöin ohjelma kysyy salasanaa kun yrität kirjautua.

## Tietokantojen varmuuskopiointi ja tuonti

### varmuuskopiointi

Voit varmuuskopioida tietokantoja sovelluksella `mysqldump.exe`

Varmuuskopiointi toimii näin:
```powershell
mysqldump.exe -u <käyttäjänimi> -p <tietokanta> > <polku><tiedosto>
```

Esimerkiksi
```powershell
#varmuuskopioidaan tietokanta uusi_db käyttäjän työpydälle
#käytetään käyttäjänimeä root, jolla ei normaalisti ole salasanaa
#siksi salasanan kehotusta "-p" ei tarvitse käyttää
mysqldump.exe -u root uusi_db > c:\users\kayttaja1\desktop\varmuuskopio_uusi_db.sql
```

### tuonti

Voit tuoda tietoja tietokantaan sovelluksella `mysql.exe`

**Huom, tietokanta täytyy luoda ennen kuin siihen voidaan viedä tietoja. Komento ei luo uutta tietokantaa**



## SQL-kielen syntaksi

Komentojen kirjaimet eivät ole "case sensitive", eli SQL ei piitta ovatko kirjaimet isoja vai pieniä:
```SQL
SeLeCt * fROm kayttajat;
```

Myöskään tietokantojen, taulujen ja sarakkeiden nimet eivät ole riippuvaisia merkkikoosta:
```SQL
kaYTajAT == kayttajat
```

Selvyyden vuoksi komennoissa käytetään usein isoja kirjaimia, ja nimissä pieniä:
```SQL
SELECT * FROM kayttajat WHERE kayttaja_nimi = 'matti';
```
<br>

>Huom, kun luodaan uusia tietokantaobjekteja, niiden nimien tulee olla erilaisia kuin saman tason muut objektit.
>
>esim: jos halutaan luoda tietokanta `TietoKanta`, huomataan että SQL antaa virheen `'Database already exists'`, koska tietokanta `tietokanta` on jo luotu. 
>Toisaalta jos luodaan uusi taulu tietokantaan nimellä, joka on käytössä toisessa tietokannassa, SQL ei anna virheitä koska kyseistä nimeä ei vielä ole käytössä samassa tietokannassa.

<br>SQL erottelee komennot toisistaan puolipisteiden avulla:
```SQL
INSERT INTO kayttajat VALUES ('matti', 'meikäläinen', '43'); SELECT * FROM kayttajat WHERE nimi = 'matti';
```

SQL ei myöskään ota huomioon rivinvaihtoja:
```SQL
CREATE TABLE kayttajat (
    id int(6) NOT NULL AUTO_INCREMENT,
    nimi varchar(20) NOT NULL,
    sukunimi varchar(30) NOT NULL
);
```

> **Huom! Ääkköset eivät välttämättä toimi kaikissa tietokannoissa automaattisesti, joten niiden käyttöä kannattaa välttää.**

Kommentit SQL kielessä erotellaan merkein `-- ` ja `/* ... */`:
```SQL
-- Tämä on lyhyt kommentti

/*Tämä kommentti
jatkuu pidemmälle*/
```

Huomaa välilyonti viivojen jälkeen: "`-- `".

Yhden rivin kommentin eteen laitetaan kaksi viivaa `-- `, ja pidemmän kommentin alkuun `/*` ja loppuun `*/`. SQL ei käy läpi kommenteissa olevaa tekstiä, joten sitä ei suoriteta tietokannassa.

<br>

## Yleisimpiä SQL-kielen komentoja

**Jotkin komennot eivät välttämättä toimi kaikilla versioilla. Tässä ohjeessa on käytetty MariaDB:n versiota 10.4.3 SQL-kielen syntaksissa**

[`CREATE DATABASE`](#create-database--komennolla-luodaan-uusi-tietokanta) - Luodaan uusi tietokanta<br>
[`CREATE TABLE`](#create-table--komennolla-luodaan-uusi-taulu-tietokantaan) - Luodaan uusi taulukko<br>
[`DROP TABLE`](#drop-table--komennolla-poistetaan-taulu-kokonaan) - Poistetaan taulukko kokonaan **(Ei voi peruuttaa, poistaa myös kaikki tiedot)**<br>
[`ALTER TABLE`](#alter-table--komennolla-voi-muokata-jo-luotujen-taulujen-sarakkeita) - Muokataan taulukkoa<br>
[`INSERT INTO`](#insert-into--komennolla-lisätään-tietoja-jo-luotuun-tietokantaan)- Lisätään tietoja taulukkoon<br>
[`SELECT`](#select--komennolla-haetaan-tietoja-tietokannan-tauluista) - Haetaan tietoja taulukosta<br>
[`WHERE`](#where--argumantilla-valitaan-tiettyjä-arvoja-tietokannasta) - Annetaan ehtoja komennoille<br>
[`UPDATE`](#update--komennolla-voidaan-muokata-taulukon-tietueita) - Muokataan tietoja taulukossa<br>
[`DELETE`](#delete--komennolla-poistetaan-tietueita-taulukosta) - Poistetaan tietoja taulukosta<br>
[`DROP DATABASE`](#drop-database--komennolla-tuhotaan-koko-tietokanta) - Poistetaan tietokanta **(Ei voi peruuttaa)**


<br>

---

<br>

### `CREATE DATABASE` -komennolla luodaan uusi tietokanta.
```SQL
CREATE DATABASE <tietokannan nimi>;
```
Kun käytetään CLI (Command Line Interface) -päätettä, luodun tietokannan voi nähdä komennolla `SHOW DATABASES;`.

Esimerkiksi:
```SQL
-- luodaan uusi tietokanta "uusi_tietokanta"
CREATE DATABASE uusi_tietokanta;
> luotiin tietokanta 'uusi_tietokanta'

-- tarkistetaan onnistuiko tietokannan luonti
SHOW DATABASES;
> tietokannat:
> vanha_tietokanta
> uusi_tietokanta
```
*kaikkien vastausten muoto on vain esimerkki, oikean haun tulokset näyttävät erilaisilta.*

> Huom, suurin osa komennoista joissa työskennellään tietokannassa ei toimi CLI -päätteessä ilman että tietokanta on valittu.\
> Valitun tietokannan näkee useimmiten CLI -päätteestä:
>```
> MariaDB [(none)]>
>```
>Käytä komentoa `USE <tietokanta>;` valitaksesi tietokannan.
>```SQL
> -- valitaan uusi_tietokanta
> MariaDB [(none)]> USE uusi_tietokanta;
> > tietokannaksi valittu 'uusi_tietokanta'
>
> MariaDB [uusi_tietokanta]> ...
>```

<br>

---

<br>

### `CREATE TABLE` -komennolla luodaan uusi taulu tietokantaan.
```SQL
CREATE TABLE <taulukon nimi> (<sarake1> <tietomuoto>, <sarake2> <tietomuoto>, ...);
```

*yleisimpiä tietomuotoja on esimerkiksi `int`: kokonaisluku, `float`: liukuluku, `varchar`: merkkijono, `text`: teksti ja `boolean` tai `bool`: totuusarvo. Lisää tietomuotoja löytyy [w3schoolin tietomuodot -sivulta](https://www.w3schools.com/sql/sql_datatypes.asp).*

*Useimmat tiedostomuodot ottavat parametriksi merkkien maksimipituuden. `int(6)` tarkoittaa siis 6 luvun yhdistelmää, eli sen maksimiarvo olisi 999 999.*

Esimerkiksi:
```SQL
-- luodaan taulukko "postaukset"
CREATE TABLE postaukset (
    id int(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    otsikko varchar(40) NOT NULL UNIQUE,
    teksti text(500) NOT NULL,
    arvostelunro float(3),
    saaNakya boolean DEFAULT '1' NOT NULL
);
```

Tiedostomuotojen lisäksi sarakkeille annetaan muitakin parametreja.\
Näistä yleisimpiä on:
```SQL
/*Pääavain, eli uniikki arvo kaikille tietueille
tämän avulla voidaan tunnistaa yksittäiset tietueet toisistaan
Pääavain on pakko asettaa kaikkiin taulukoihin*/
PRIMARY KEY

-- ei saa olla tyhjä
NOT NULL

-- lisää aina yksi kun luodaan uusi tietue
AUTO_INCREMENT

-- aina uniikki, ei samanlaisia arvoja sarakkeessa
UNIQUE

-- oletusarvo
DEFAULT
```

CLI -päätteessä komennolla `SHOW TABLES;` voi nähdä kaikki taulut:
```SQL
-- luodaan tietokanta "kayttajat"
CREATE TABLE kayttajat (
    id int(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nimi varchar(20) NOT NULL,
    sukunimi varchar(30) NOT NULL
);
> luotu taulukko 'kayttajat'

-- tarkistetaan että taulukon tuonti onnistui
SHOW TABLES;
> taulukot:
> vanha_taulukko
> kayttajat
```

<br>

---

<br>

### `DROP TABLE` -komennolla poistetaan taulu kokonaan. 
**Myös kaikki taulukon tiedot katoavat!**
```SQL
DROP TABLE <taulukko>;
```

<br>

---

<br>

### `ALTER TABLE` -komennolla voi muokata jo luotujen taulujen sarakkeita.
```SQL
ALTER TABLE <taulun nimi> (ADD | CHANGE | MODIFY | ADD) <sarake> [<parametrit>];
```
<br>

- `ADD` -parametrilla lisätään tauluun lisää sarakkeita:
```SQL
-- lisätään sarake ika
ALTER TABLE kayttajat ADD ika int(6) NOT NULL;
```

- `MODIFY` -parametrilla muutetaan sarakkeen parametrejä:
```SQL
-- muokataan sarakkeen ika maksimipituutta pienemmäksi
ALTER TABLE kayttajat MODIFY asiakas_id int(3) NOT NULL;
```
*Kun käytetään `MODIFY` -parametriä, täytyy asettaa kaikki parametrit uudelleen sarakkeeseen.*

- `CHANGE` -parametri on samanlainen kuin edellinen, mutta sillä voi muokata nimeä:
```SQL
-- Muutetaan sarakkeen ika nimeä
ALTER TABLE kayttajat CHANGE ika asiakas_id int(3) NOT NULL;
```
*Samoin kuin `MODIFY` -parametrillä, `CHANGE` -parametrillä täytyy asettaa kaikki parametrit uudelleen sarakkeeseen.*

> Uudemmissa versioissa nimeä pystyy vaihtamaan sarakkeen nimeä parametrilla `RENAME`:
> ```SQL
> -- Muutetaan sarakkeen ika nimeä
> ALTER TABLE kayttajat RENAME ika TO asiakas_id;
> ```

- `DROP` -parametrilla poistetaan sarake taulukosta:
```SQL
-- Poistetaan sarake asiakas_id
ALTER TABLE kayttajat DROP asiakas_id;
```
<br>

Kun luodaan taulukoita, tai muokataan taulujen sarakkeita, kannattaa tarkistaa taulujen parametrit säännöllisesti komennolla `DESCRIBE <taulukko>;` (lyhenteenä `DESC`):
```SQL
-- Tarkistetaan onko taulukon sarakkeiden tiedot oikein
DESCRIBE kayttajat;
> nimi          tyyppi      tyhjä   Avain   Oletus  Lisää
> id            int(6)      NO      PRI     NULL    auto_increment
> nimi          varchar(20) NO              NULL    
> sukunimi      varchar(30) NO              NULL    
```

<br>

---

<br>

### `INSERT INTO` -komennolla lisätään tietoja jo luotuun tietokantaan.
```SQL
INSERT INTO <taulukko> [(sarake1, sarake2, ...)] VALUES (arvo1, arvo2, ...);
```

Esimerkiksi:
```SQL
-- lisätään taulukkoon kayttajat tietueita
INSERT INTO kayttajat (nimi, sukunimi) VALUES ('Matti', 'Meikäläinen');
```

*Sarakkeet ja niiden arvot kirjoitetaan järjestyksessä oikealta vasemmalle. Sarakkeet voivat olla missä järjestyksessä tahansa, mutta niiden arvojen on oltava samassa järjestyksessä:*
```SQL
INSERT INTO kayttajat (sukunimi, nimi) VALUES ('Korhonen', 'Anna');
```

Komentoon ei ole pakko asettaa sarakkeita erikseen:
```SQL
INSERT INTO kayttajat VALUES (3, 'Risto', 'Virtanen');
``` 

Jos et aseta sarakenimiä, tulee sinun kuitenkin asettaa arvo kaikkiin taulukon sarakkeisiin järjestyksessä, tai tietokanta antaa virheilmoituksen.

<br>

---

<br>

### `SELECT` -komennolla haetaan tietoja tietokannan tauluista.

```SQL
SELECT <sarake1>[, <sarake2>, ...] FROM <taulukko>;
```
<br>

Parametri '*' tarkoittaa kaikkia sarakkeita.

Esimerkiksi:
```SQL
-- Haetaan kaikki tietueet taulukosta kayttajat
SELECT * FROM kayttajat;

> id        nimi        sukunimi
> 1         Matti       Meikäläinen
> 2         Anna        Korhonen
> 3         Risto       Virtanen
```
Komento palauttaa kaikki tiedot `kayttajat`, taulukosta.
<br><br>

Komennolla voi myös hakea vain tiettyjä sarakkeita:
```SQL
-- Haetaan sarakkeiden id ja sukunimi tiedot taulukota kayttajat
SELECT id, sukunimi FROM kayttajat;

> id        sukunimi
> 1         Meikäläinen
> 2         Korhonen
> 3         Virtanen
```
<br>

---

<br>

### `WHERE` -argumantilla valitaan tiettyjä arvoja tietokannasta. 
`WHERE` -argumenttia ei voi käyttää yksistään, mutta sitä käytetään monessa eri komennossa tiedon valitsemista varten.
```SQL
... WHERE <ehto>;
```

Esimerkiksi:
```SQL
-- Haetaan kaikki tietueet taulukosta kayttajat, missä id on 2
SELECT * FROM kayttajat WHERE id = 2;
> id        nimi        sukunimi
> 2         Anna        Korhonen
```
`WHERE` -komennolla on monia loogisia operaattoreita, kuten:

- `=`           on yhtä kuin
- `>`/`<`       suurempi/pienempi kuin
- `>=`/`<=`     yhtä suuri tai suurempi/pienempi kuin
- `<>`          ei yhtä suuri kuin

*joissain SQL:n versioissa* `<>` *on kirjoitettu* `!=`

Lisäksi komennolla on muutama ehto joilla voi lisätä hakufunktion ominaisuuksia:

- `BETWEEN` argumentilla saadaan tietueet tiettyjen arvojen välistä:
```SQL
-- Heataan missä id on lukujen 2 ja 3 välissä
SELECT id, nimi FROM kayttajat WHERE id BETWEEN 2 AND 3;
> id        nimi
> 2         Anna
> 3         Risto
```
Haku palauttaa kaikki tietueet joissa id on arvojen 2 ja 3 välissä.

- `LIKE` argumentilla voidaan valita tietyillä merkkijonoilla alkavia, loppuvia tai tietyn merkkijonon sisältäviä arvoja:
```SQL
-- Haetaan missä sukunimen kolmas kirjain on "r"
SELECT id, sukunimi FROM kayttajat WHERE sukunimi LIKE '__r%';
> id        sukunimi
> 2         Korhonen
> 3         Virtanen
```
Komento palauttaa kaikki tietueet, joissa sarakkeen sukunimi -arvojen kolmas kirjain on 'r'.

merkki `'_'` tarkoittaa mitä tahansa yhtä kirjainta, ja `'%'` mitä tahansa merkkijonoa. *Joissain SQL versioissa yhden kirjaimen merkkinä käytetään merkkiä `'*'`.*

- `IN` argumentilla voidaan hakea montaa eri hakuarvoa:
```SQL
-- Haetaan kaikki käyttäjät nimillä matti ja risto
SELECT id, nimi FROM kayttajat WHERE nimi IN ('Matti', 'Risto');
> id        nimi
> 1         Matti
> 3         Risto
```

> `IN` -argumenttia voi käyttää myös toisen `SELECT` -komennon yhdistämistä varten.
> Tämä voi olla hyödyllistä kun täytyy hakea tietoja toisen taulukon avulla:
> ```SQL
> -- tältä näyttää taulukko ostot
> SELECT * FROM ostot;
> > id      tuote       ostaja
> > 1       kattila     Risto
> > 2       pata        Anna
>
> /*Haetaan kaikki käyttäjät jotka ovat ostaneet jotakin,
> eli nimi on taulukossa ostot*/
> SELECT * FROM kayttajat WHERE nimi IN (SELECT ostaja FROM ostot);
> > id      nimi        sukunimi
> > 2       Anna        Korhonen
> > 3       Risto       Virtanen
> ```
> *Voit myöskin käyttää `WHERE` -argumenttia `IN` -argumentin jälkeisessä haussa tarkentaaksesi haluamiasi tietoja*

<br>

---

<br>

### `UPDATE` -komennolla voidaan muokata taulukon tietueita.
```SQL
UPDATE <taulukko> SET <sarake1> = <arvo>, <sarake2> = <arvo>, ... WHERE <ehto>;
```

Esimerkiksi:
```SQL
SELECT * FROM kayttajat WHERE nimi = 'Risto';
> id        nimi        sukunimi
> 3         Risto       Virtanen

-- muutetaan käyttäjän risto nimeä ja sukunimeä
UPDATE kayttajat SET nimi = 'Mikko', sukunimi = 'Muodonmuuttaja' WHERE nimi = 'Risto';
> Muutettu taulukon kayttajat tietoja

SELECT * FROM kayttajat;
> id        nimi        sukunimi
> 1         Matti       Meikäläinen
> 2         Anna        Korhonen
> 3         Mikko       Muodonmuuttaja
```

Voit myös muuttaa vain yhden sarakkeen tietoja.

**Huom, jos WHERE -ehto osuu useampaan tietueeseen, kaikki valitut tietueet muuttuvat.**

<br>

---

<br>

### `DELETE` -komennolla poistetaan tietueita taulukosta.
```SQL
DELETE FROM <taulukko> WHERE <ehto>;
```

Esimerkiksi:
```SQL
-- poistetaan kaikki tietueet joissa nimenä on "Anna"
DELETE FROM kayttajat WHERE name = 'Anna';
> poistettu 'Anna' taulukosta kayttajat

SELECT id, nimi FROM kayttajat;
> id        nimi
> 1         Matti
> 3         Mikko
```

> **Huom! jos et laita komentoon `WHERE` -argumenttia, komento poistaa kaikki tietueet**
> ```SQL
> -- poistetaan kaikki taulukon tietueet
> DELETE FROM kayttajat;
> > taulukon kayttajat kaikki tietueet poistettu
>
> SELECT * FROM kayttajat;
> > id      nimi        sukunimi
> > 
> ```
> Tähän tarkoitukseen voidaan myös käyttää komentoa `TRUNCATE TABLE <taulukko>;`.
> 
> `TUNCATE TABLE` -komento on tehokkaampi kun halutaan poistaa kaikki tietueet, sillä se ei käy läpi tietueita erikseen.

<br>

---

<br>

### `DROP DATABASE` -komennolla tuhotaan koko tietokanta. 

**HUOM!! POISTETUN TIETOKANNAN TIETOJA ON MAHDOTON PALAUTTAA POISTON JÄLKEEN ILMAN VARMUUSKOPIOTA!**

```SQL
DROP DATABASE <tietokanta>;
```

Esimerkiksi:
```SQL
SHOW DATABASES;
> tietokannat
> vanha_tietokanta
> uusi_tietokanta

-- poistetaan tietokanta
DROP DATABASE uusi_tietokanta;
> poistettu tietokanta uusi_tietokanta

SHOW DATABASES;
> tietokannat
> vanha_tietokanta
```

<br>

---

<br>

**MariaDB:n tässä versiossa, on mahdotonta luoda varmuuskopiota SQL-päätteen kautta. Varmuuskopio täytyy luoda käyttäen mysqldump.exe -sovellusta MariaDB:n tiedostosijainnissa.**

<br>

---

<br>