require 'sinatra'
require 'sqlite3'
require 'sequel'

DB = Sequel.sqlite('app.db')

get '/' do
  @user_count = DB[:users].count
  @city_count = DB[:cities].count
  erb :overview
end

get '/users' do
  @users = DB[:users]
  erb :users
end

get '/users/new' do
  @cities = DB[:cities]
  erb :new_user
end

post '/users' do
  DB[:users].insert(
    first_name: params[:first_name],
    last_name: params[:last_name],
    city_id: params[:city_id]
  )
  redirect '/users'
end

get '/cities' do
  @cities = DB[:cities]
  erb :cities
end
