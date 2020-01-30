## REALESTATE-APP PROJECT

Application Development Problems Challenges Lessons

How to process the app
Ultilize Ruby and SQL program languages
Create database realestate_app, create houses and users tables and create schema.sql records
Use sinatra new realestate_app -va to generate the boilerplate folders and files

Development
Ruby and SQL program languages, require various libraries to bulid the app
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require 'bcrypt'
require_relative 'models/house.rb'
enable :sessions

Problem and challenge

1. how to insert email and password into database, try to hardcode store in database but could not get the password with digest which can not log in. So I created test.rb and insert "sql = "INSERT INTO users(email, password_digest) VALUES ('#{email}','#{digest_password.to_s}');" to database and also use bcrypt "digest_password = BCrypt::Password.create(password)";
   Also I could not get the users data even if I create test.rb , finally found it out that I have to run the ruby test.rb in the terminal then can store data successfully
2. click link<a> then delete the whole image and name, check the <a> link and erb to fix
3. if results.count == 1 && BCrypt::Password.new(results[0]['password_digest']) == params[:password], originally put bracket in wrong place cause invalidHash at /login. Found out sql is string; BCrypt::Password.new(" ")
4. can not get '/house/:id' if my code "sql = "select \* from houses where id = \$1;"
   @house = run_sql(sql, [params[:id]]).first", should fix like this ""

Lessons

1. understand using grid for css
   2.learned how to use the routes and how to connect the mian.rb and some erb to how to display on url oand learned basic struture of the whole project, break into different functions  
   3.learned how to use sinatra to find out the errors and tried to fix them; learn to pay attention to details
2. learned how to use the heroku to deply as website

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
