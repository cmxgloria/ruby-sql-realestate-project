```

gloriachen=# \c realestate_app
You are now connected to database "realestate_app" as user "gloriachen".
realestate_app=# \dt
          List of relations
 Schema |  Name  | Type  |   Owner
--------+--------+-------+------------
 public | houses | table | gloriachen
 public | users  | table | gloriachen
(2 rows)

realestate_app=# select * from houses;
 id |   name    |                                                    image_url                                                    |  price  |               address                | user_id
----+-----------+-----------------------------------------------------------------------------------------------------------------+---------+--------------------------------------+---------
  9 | Macleod   | https://i2.au.reastatic.net/800x600/3ee52706a4d1f2621d9f2132de78aa3a2058051622f0a86dca033a28b337fc92/image.jpg  | 1400000 | 83 Gresswell Road Macleod Vic 3085   |
 10 | Toorak    | https://i2.au.reastatic.net/800x600/29e266f520d4acf9b806d8e53d5425ee2c9bf14253071034b0b9333e31297569/image.jpg  | 2900000 | 1 Denham Place Toorak Vic 3142       |
 11 | Brighton  | https://i2.au.reastatic.net/1110x535/21b344c73af11e238bb53a052dbf751763f23a5691c3c1ef04f7914e3bb9576a/image.jpg | 2400000 | 81 Bay Street Brighton Vic 3186      |
 12 | Footscray | https://i2.au.reastatic.net/800x600/b2112f7f811d1f66b3c2a9c333108803ecd475219eb5b4d79319256d06a3d371/image.jpg  |  790000 | 6 Souter Crescent Footscray Vic 3011 |
(4 rows)

realestate_app=# select * from users;
 id |    email     |                       password_digest
----+--------------+--------------------------------------------------------------
  3 | dt@ga.co     | $2a$12$i.Folk/vuMcxjQYIlR4AMe0JWCpBPhnx.pgt5N9Xa6VShVsGzCORa
  4 | gloria@ga.co | $2a$12$qonXBlEC4ipG5mWlNq.cveRFW87Rs4T3ZihsbcnmCeC61r1JoHluG
  ```
  
