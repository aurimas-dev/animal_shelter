require('pry-byebug')
require_relative('../models/Log.rb')

get '/history' do
  @logs = Log.all()
  erb(:"history/index")
end
