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
Luodun tietokannan voi nähdä komennolla `SHOW DATABASES;`.

Esimerkiksi:
```SQL
CREATE DATABASE uusi_tietokanta;
> luotiin tietokanta 'uusi_tietokanta'      ;

SHOW DATABASES;                                     
> tietokannat:                              ;
> vanha_tietokanta                          ;
> uusi_tietokanta                           ;
```
*kaikkien vastausten muoto on vain esimerkki, oikean haun tulokset näyttävät erilaisilta.*

> Huom, suurin osa komennoista joissa työskennellään tietokannassa ei toimi CLI (Command Line Interface) -päätteessä ilman että tietokanta on valittu.\
>Käytä komentoa `USE <tietokanta>;` valitaksesi tietokannan.

<br><br>

`CREATE TABLE` -komennolla luodaan uusi taulu tietokantaan.
```SQL
CREATE TABLE <taulukon nimi> (<sarake1> <tietomuoto>, <sarake2> <tietomuoto>, ...);
```


<br><br>

`SELECT` -komennolla haetaan tietoja tietokannan tauluista.

```SQL
SELECT <sarake1>[, <sarake2>, ...] FROM <taulukko>;
```
<br>

Parametri "*" tarkoittaa kaikkia sarakkeita.

Esimerkiksi:
```SQL
SELECT * FROM kayttajat;

> id        nimi        sukunimi
> 1         Matti       Meikäläinen
> 2         Anna        Korhonen
> 3         Risto       Virtanen
```
Komento palauttaa kaikki tiedot `kayttajat`, taulukosta.\

Komennolla voi myös hakea vain tiettyjä sarakkeita:
```SQL
SELECT id, sukunimi FROM kayttajat;

> id        sukunimi
> 1         Meikäläinen
> 2         Korhonen
> 3         Virtanen
```
<br><br>

