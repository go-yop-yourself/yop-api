require 'sinatra'
require 'sequel'
require 'houston'

uri = if ENV["DATABASE_URL"]
  ENV["DATABASE_URL"]
else
  "sqlite://db/yop.db"
end

DB = Sequel.connect(uri)
APN = Houston::Client.development
APN.certificate = File.read("keys/aps_development.cer")

post "/users" do
  DB[:users].insert(
    username: params[:username],
    device_token: params[:deviceToken]
  )
  status 201
end

post "/notifications" do
  to_username = params[:username]
  user = DB[:users].where(:username => to_username).first
  notification = Houston::Notification.new(device: user[:device_token])
  notification.alert = "YOP"

  APN.push(notification)
end
