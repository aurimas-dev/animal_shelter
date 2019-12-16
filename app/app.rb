require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/animals_controller.rb')
require_relative('./controllers/owners_controller.rb')
require_relative('./controllers/history_controller.rb')
require_relative('./db/seed.rb')

also_reload('./controllers/*')
also_reload('./models/*')

set :bind, '0.0.0.0'

get '/seed' do
  AnimalShelterSeed.seed();
  redirect '/animals', 303;
end

get '/' do
  erb(:index)
end
