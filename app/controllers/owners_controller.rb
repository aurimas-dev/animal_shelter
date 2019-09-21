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
  @title = "Available owners"
  erb(:"/owners/filter")
end

get '/owners/:id' do
  @owner = Owner.find_by_id(params["id"])
  @owned_animal = @owner.get_owned_animal()
  erb(:"/owners/show")
end
