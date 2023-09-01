# SQL-kieli

### Mikä on SQL-kieli

- SQL on stantardisoitu kieli viestimiseen tietokannan kanssa
- SQL on lyhennelmä sanoista "Structured Query Language", se tarkoittaa suomeksi Jäsenneltyä kyselykieltä
- Suurin osa nykyisistä tietokantapalvelimista tukee tietokantojen ja tiedon hallintaa SQL kielellä

#### Mihin SQL-kieltä käytetään?

- SQL:ää käytetään tietokantojen hallinnointiin suoraan CLI-päätteestä (Command Line Interface), tai koodista.
- Sen avulla voidaan sekä hallinnoida tietokantoja, käyttäjiä ja niiden oikeuksia, että hakea, lisätä, muokata ja poistaa tietokantojen taulukoita ja tietueita.




### SQL-kielen syntaksi

#### Komennot:

Komentojen kirjaimet eivät ole "case sensitive", eli SQL ei piitta ovatko kirjaimet isoja vai pieniä:\
`SeLeCt * fROm kayttajat;`

Myöskään tietokantojen, taulujen ja sarakkeiden nimet eivät ole riippuvaisia merkkikoosta:\
`kaYTajAT == kayttajat`

Selvyyden vuoksi komennoissa käytetään usein isoja kirjaimia, ja nimissä pieniä:\
`SELECT * FROM kayttajat WHERE kayttaja_nimi = 'matti';`<br><br>

>Huom, kun luodaan uusia tietokantaobjekteja, niiden nimien tulee olla erilaisia kuin saman tason muut objektit.
>
>esim: jos halutaan luoda tietokanta `TietoKanta`, huomataan että SQL antaa virheen `'Database exists'`, koska tietokanta `tietokanta` on jo luotu. 
>Toisaalta jos luodaan uusi taulu tietokantaan nimellä, joka on käytössä toisessa tietokannassa, SQL ei anna virheitä koska kyseistä nimeä ei vielä ole käytössä samassa tietokannassa.

<br>SQL erottelee komennot toisistaan puolipisteiden avulla:\
`INSERT INTO kayttajat VALUES ('matti', 'meikäläinen', '43'); SELECT * FROM kayttajat WHERE nimi = 'matti';`
