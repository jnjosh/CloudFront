require 'rubygems'
require 'sinatra'
require 'cloudapp_api'

get '/' do
  @title = "Welcome to CloudFront"
  erb :welcome
end

get '/shorten/' do
  @url = params[:url]
  @username = params[:email]
  @password = params[:pwd]

  CloudApp.authenticate @username, @password
  @item = CloudApp::Item.create :bookmark, {:name => @url, :redirect_url => @url}
  
  return @item["url"]
end
