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



### SQL-kielen syntaksi

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
>esim: jos halutaan luoda tietokanta `TietoKanta`, huomataan että SQL antaa virheen `'Database exists'`, koska tietokanta `tietokanta` on jo luotu. 
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
<br>



### Yleisimpiä SQL-kielen komentoja

`CREATE DATABASE` -komennolla luodaan uusi tietokanta.
```SQL
CREATE DATABASE <tietokannan nimi>;
```
Kun käytetään CLI (Command Line Interface) -päätettä, luodun tietokannan voi nähdä komennolla `SHOW DATABASES;`.

Esimerkiksi:
```SQL
CREATE DATABASE uusi_tietokanta;
> luotiin tietokanta 'uusi_tietokanta'

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
> MariaDB [(none)]> USE uusi_tietokanta;
> > tietokannaksi valittu 'uusi_tietokanta'
>
> MariaDB [uusi_tietokanta]>
>```
<br><br>



`CREATE TABLE` -komennolla luodaan uusi taulu tietokantaan.
```SQL
CREATE TABLE <taulukon nimi> (<sarake1> <tietomuoto>, <sarake2> <tietomuoto>, ...);
```

*yleisimpiä tietomuotoja on esimerkiksi `int`: kokonaisluku, `float`: liukuluku, `varchar`: merkkijono, `text`: teksti ja `boolean` tai `bool`: totuusarvo. Lisää tietomuotoja löytyy [w3schoolin tietomuodot -sivulta](https://www.w3schools.com/sql/sql_datatypes.asp).*

*Useimmat tiedostomuodot ottavat parametriksi merkkien maksimipituuden. `int(6)` tarkoittaa siis 6 luvun yhdistelmää, eli sen maksimiarvo olisi 999 999.*

<br><br>

Esimerkiksi:
```SQL
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
#Pääavain, eli uniikki arvo kaikille tietueille
#tämän avulla voidaan tunnistaa yksittäiset tietueet toisistaan
#Pääavain on pakko asettaa kaikkiin taulukoihin
PRIMARY KEY

#ei saa olla tyhjä
NOT NULL

#lisää aina yksi kun luodaan uusi tietue
AUTO_INCREMENT

#aina uniikki, ei samanlaisia arvoja sarakkeessa
UNIQUE

#oletusarvo'
DEFAULT
```

<br><br>



`SELECT` -komennolla haetaan tietoja tietokannan tauluista.

```SQL
SELECT <sarake1>[, <sarake2>, ...] FROM <taulukko>;
```
<br>

Parametri '*' tarkoittaa kaikkia sarakkeita.

Esimerkiksi:
```SQL
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
SELECT id, sukunimi FROM kayttajat;

> id        sukunimi
> 1         Meikäläinen
> 2         Korhonen
> 3         Virtanen
```
<br><br>

