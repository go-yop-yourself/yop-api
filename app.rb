require 'sinatra'
require 'sequel'

DB = Sequel.connect("sqlite://db/yop.db")

post "/users" do
  DB[:users].insert(
    username: params[:username],
    device_token: params[:deviceToken]
  )
  status 201
end

post "/notifications" do
  
end

get '/yop' do
  "Hello World!"
end
