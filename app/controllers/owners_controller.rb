require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/Animal.rb')
require_relative('../models/Owner.rb')
also_reload('../models/*')

get '/owners' do
  erb(:"owners/index")
end
