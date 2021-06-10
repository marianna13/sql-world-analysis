use world;

show tables;
--There're 3 tables in the world database:
--+-----------------+
--| Tables_in_world |
--+-----------------+
--| city            |
--| country         |
--| countrylanguage |
--+-----------------+


SELECT * FROM city limit 10;
--+----+----------------+-------------+---------------+------------+
--| ID | Name           | CountryCode | District      | Population |
--+----+----------------+-------------+---------------+------------+
--|  1 | Kabul          | AFG         | Kabol         |    1780000 |
--|  2 | Qandahar       | AFG         | Qandahar      |     237500 |
--|  3 | Herat          | AFG         | Herat         |     186800 |
--|  4 | Mazar-e-Sharif | AFG         | Balkh         |     127800 |
--|  5 | Amsterdam      | NLD         | Noord-Holland |     731200 |
--|  6 | Rotterdam      | NLD         | Zuid-Holland  |     593321 |
--|  7 | Haag           | NLD         | Zuid-Holland  |     440900 |
--|  8 | Utrecht        | NLD         | Utrecht       |     234323 |
--|  9 | Eindhoven      | NLD         | Noord-Brabant |     201843 |
--| 10 | Tilburg        | NLD         | Noord-Brabant |     193238 |
--+----+----------------+-------------+---------------+------------+


SELECT countrycode, country.name, SUM(city.population) FROM city 
JOIN country ON (countrycode=code)
GROUP BY countrycode ORDER BY SUM(country.population) limit 10;
--Countries with least city population:
--+-------------+-------------------------------+----------------------+
--| countrycode | name                          | SUM(city.population) |
--+-------------+-------------------------------+----------------------+
--| PCN         | Pitcairn                      |                   42 |
--| VAT         | Holy See (Vatican City State) |                  455 |
--| CCK         | Cocos (Keeling) Islands       |                  670 |
--| FLK         | Falkland Islands              |                 1636 |
--| NFK         | Norfolk Island                |                  800 |
--| NIU         | Niue                          |                  682 |
--| TKL         | Tokelau                       |                  300 |
--| CXR         | Christmas Island              |                  700 |
--| SJM         | Svalbard and Jan Mayen        |                 1438 |
--| SHN         | Saint Helena                  |                 1500 |
--+-------------+-------------------------------+----------------------+

SELECT * from countrylanguage limit 10;

--+-------------+------------+------------+------------+
--| CountryCode | Language   | IsOfficial | Percentage |
--+-------------+------------+------------+------------+
--| ABW         | Dutch      | T          |        5.3 |
--| ABW         | English    | F          |        9.5 |
--| ABW         | Papiamento | F          |       76.7 |
--| ABW         | Spanish    | F          |        7.4 |
--| AFG         | Balochi    | F          |        0.9 |
--| AFG         | Dari       | T          |       32.1 |
--| AFG         | Pashto     | T          |       52.4 |
--| AFG         | Turkmenian | F          |        1.9 |
--| AFG         | Uzbek      | F          |        8.8 |
--| AGO         | Ambo       | F          |        2.4 |
--+-------------+------------+------------+------------+

select region, SUM(population) from country 
GROUP BY region 
ORDER BY SUM(population) DESC limit 10;
--Region of the World in their population:
--+---------------------------+-----------------+
--| region                    | SUM(population) |
--+---------------------------+-----------------+
--| Eastern Asia              |      1507328000 |
--| Southern and Central Asia |      1490776000 |
--| Southeast Asia            |       518541000 |
--| South America             |       345780000 |
--| North America             |       309632000 |
--| Eastern Europe            |       307026000 |
--| Eastern Africa            |       246999000 |
--| Western Africa            |       221672000 |
--| Middle East               |       188380700 |
--| Western Europe            |       183247600 |
--+---------------------------+-----------------+

SELECT language, SUM(population*percentage/100) AS NuberOfSpeakers FROM countrylanguage 
JOIN country ON (country.code=countrylanguage.countrycode) 
GROUP BY language 
ORDER BY SUM(population*percentage) DESC limit 10;
--TOP 10 languages of the World by number of speakers:
--+------------+------------------+
--| language   | NuberOfSpeakers  |
--+------------+------------------+
--| Chinese    | 1191843539.00000 |
--| Hindi      |  405633070.00000 |
--| Spanish    |  355029462.00000 |
--| English    |  347077867.30000 |
--| Arabic     |  233839238.70000 |
--| Bengali    |  209304719.00000 |
--| Portuguese |  177595269.40000 |
--| Russian    |  160807561.30000 |
--| Japanese   |  126814108.00000 |
--| Punjabi    |  104025371.00000 |
--+------------+------------------+

SELECT language, SUM(gnp) FROM countrylanguage 
JOIN country ON (country.code=countrylanguage.countrycode)
GROUP BY language 
ORDER BY SUM(gnp) DESC limit 10;
--TOP 10 languages of the World by GNP of countries where they're spoken:
--+------------+-------------+
--| language   | SUM(gnp)    |
--+------------+-------------+
--| Italian    | 15830045.00 |
--| English    | 15555271.20 |
--| German     | 14779245.00 |
--| Chinese    | 14535473.00 |
--| Japanese   | 13075678.00 |
--| Korean     | 12625020.00 |
--| Spanish    | 12589832.00 |
--| French     | 12271447.00 |
--| Polish     | 11734475.00 |
--| Portuguese | 11449412.00 |
--+------------+-------------+






