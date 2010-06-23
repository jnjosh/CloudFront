require 'rubygems'
require 'sinatra'
require 'cloudapp_api'

get '/shorten/' do
  @url = params[:url]
  @username = params[:email]
  @password = params[:pwd]

  CloudApp.authenticate @username, @password
  @item = CloudApp::Item.create :bookmark, {:name => @url, :redirect_url => @url}
  
  newurl = @item["url"]
  "#{newurl}"
end
