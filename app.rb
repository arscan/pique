require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/cue.rb'
require './models/item.rb'

 
get '/' do
    "Hello, World!"
end
