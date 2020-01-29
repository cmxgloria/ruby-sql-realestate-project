require 'pg'
require 'bcrypt'
require 'pry'

conn = PG.connect(dbname: 'realestate_app')
email = 'dt@ga.co'
password = 'pudding'
email = 'gloria@ga.co'
password = 'cola'

digest_password = BCrypt::Password.create(password)
sql = "INSERT INTO users(email, password_digest) VALUES ('#{email}','#{digest_password.to_s}');"
conn.exec(sql)
conn.close