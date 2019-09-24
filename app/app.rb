require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/animals_controller.rb')
require_relative('./controllers/owners_controller.rb')
require_relative('./models/Settings.rb')

also_reload('./controllers/*')
also_reload('./models/*')

# Global app settings
@@settings = Settings

get '/' do
  erb(:index)
end
