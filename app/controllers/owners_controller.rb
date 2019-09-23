require_relative('../models/Animal.rb')
require_relative('../models/Owner.rb')

get '/owners' do
  @owners = Owner.all()
  erb(:"/owners/index")
end

get '/owners/new' do
  erb(:"/owners/new")
end

post '/owners' do
  owner = Owner.new(params)
  owner.save()
  redirect to('/owners')
end

get '/owners/filters/available' do
  @owners = Owner.all_available()
  @title = "Available Owners"
  erb(:"/owners/filter")
end

get '/owners/:id' do
  @owner = Owner.find_by_id(params["id"])
  @owned_animals = @owner.get_owned_animals()
  erb(:"/owners/show")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update()
  redirect to("/owners/#{params['id']}")
end

post '/owners/:id/delete' do
  owner = Owner.find_by_id(params['id'].to_i())
  owner.delete()
  redirect to("/owners")
end

get '/owners/:id/edit' do
  @owner = Owner.find_by_id(params['id'].to_i())
  erb(:"/owners/edit")
end
