require 'pg'
require 'bcrypt'
require 'pry'
# update password in database, not let this on public area; next time run ruby test.rb in database to store in then delete before put in public
conn = PG.connect(dbname: 'realestate_app')
# only one account here, other will overwrite
email = 'dt@ga.co'
password = 'pudding'
email = 'gloria@ga.co'
password = 'cola'

digest_password = BCrypt::Password.create(password)
sql = "INSERT INTO users(email, password_digest) VALUES ('#{email}','#{digest_password.to_s}');"
conn.exec(sql)
conn.close