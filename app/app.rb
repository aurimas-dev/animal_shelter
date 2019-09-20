require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/animals_controller.rb')
require_relative('./controllers/owners_controller.rb')

also_reload('./controllers/*')
also_reload('./models/*')

get '/' do
  erb(:index)
end
