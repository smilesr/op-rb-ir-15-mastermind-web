# will return the directory relative to the file this command is called from; __FILE__ is a reference to the current file name; unshift prepend the argument to the file
# $:.unshift(File.expand_path('./', __FILE__))

require 'sinatra'
require_relative 'mastermind_controller'
require 'pry'
require 'json'

get '/' do

  erb :index
end

get '/secretcode' do
  secretcode = (MastermindGame::SecretCode.new)
  binding.pry
  @secretcode = secretcode.code.to_json
end