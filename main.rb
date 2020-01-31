     
require 'sinatra'
require 'pg'
require 'bcrypt'
require_relative 'models/house'
require_relative 'db/shared'
enable :sessions

if development?   #only run the code in development
  require 'sinatra/reloader'
  require 'pry'
  also_reload
end

def logged_in?
  if session[:user_id]
    return true
  else
    return false
  end
end

def current_user
  run_sql("select * from users where id = #{session[:user_id]};")[0]
end
# all route
get '/' do
  @results = run_sql("select * from houses order by name asc;")
  erb :index
end
# have to move up, if down route name match then it run this route '/houses/:id'
get '/houses/new' do
  erb :new_house
end
# create new house
post '/houses/new' do
  redirect '/login' unless logged_in?
  sql = "insert into houses (name, image_url, price, address, user_id) values ('#{params[:name]}', '#{params[:image_url]}', '#{params[:price]}','#{params[:address]}', '#{session[:user_id]}');"
  run_sql(sql)
 redirect '/'
 
end
# read houses
get '/houses/:id' do
  sql = "select * from houses where id = '#{params[:id]}';"
  @house = run_sql(sql).first
  erb :details
end

# delete sold house
delete '/houses/:id' do
  sql = "delete from houses where id = #{params[:id]};"
  run_sql(sql)
  redirect '/'
end

# edit
get '/houses/:id/edit' do
  sql = "select * from houses where id = #{params[:id]};"
  @house = run_sql(sql)[0]
  erb :edit_house
end

# update
patch '/houses/:id/edit' do
  sql = "update houses set name = '#{params[:name]}', image_url = '#{params[:image_url]}', price = #{params[:price]}, address = '#{params[:address]}' where id = #{params[:id]};"
  run_sql(sql)
  redirect "/houses/#{params[:id]}"
end

get '/login' do
  erb :login
end

# user to login
post '/login' do
  sql = "select * from users where email = '#{params[:email]}';"
  results = run_sql(sql)
  # if "1" email exist, check input password whether digest match
  if results.count == 1 && BCrypt::Password.new(results[0]['password_digest']) == params[:password]
    session[:user_id] = results[0]['id']
    redirect '/'
  else
    #if not correct go back to login again
    erb :login
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect '/login'
end

get '/my_house' do
  redirect '/login' unless logged_in?
  @houses = run_sql("select * from houses where user_id = #{current_user['id']};")
  erb :my_house
end