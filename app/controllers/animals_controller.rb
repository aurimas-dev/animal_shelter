require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/Animal.rb')
require_relative('../models/Owner.rb')
also_reload('../models/*')

get '/animals' do
  erb(:"animals/index")
end
