require('pry-byebug')
require('date')

require_relative('../models/Animal.rb')
require_relative('../models/Owner.rb')

get '/animals' do
  @animals = Animal.all()
  erb(:"/animals/index")
end

get '/animals/new' do
  @today = Date.today()
  @types = Animal.get_types()
  erb(:"/animals/new")
end

post '/animals' do
  animal = Animal.new(params)
  animal.save()
  redirect to('/animals')
end

get '/animals/search' do
  @search = params['type']
  @animals = Animal.find_by_type_or_name(@search)
  @types = Animal.get_types()
  erb(:"/animals/search")
end

get '/animals/:id' do
  @animal = Animal.find_by_id(params['id'].to_i())
  @owner = Owner.find_by_id(@animal.owner_id())
  erb(:"/animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find_by_id(params['id'].to_i())
  @owners = Owner.all_available_and_include_id(@animal.owner_id())
  @types = Animal.get_types()
  erb(:"/animals/edit")
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.assign_owner(params['owner_id'].to_i())
  animal.update()
  redirect to("/animals/#{params['id']}")
end

post '/animals/:id/delete' do
  animal = Animal.find_by_id(params['id'].to_i())
  animal.delete()
  redirect to("/animals")
end

get '/animals/filters/unavailable' do
  @animals = Animal.all_unavailable_for_adoption()
  @title = "Unavailable Animals"
  erb(:"/animals/filter")
end

get '/animals/filters/available' do
  @animals = Animal.all_available_for_adoption()
  @title = "Available Animals"
  erb(:"/animals/filter")
end

get '/animals/filters/adopted' do
  @animals = Animal.all_adopted()
  @title = "Adopted Animals"
  erb(:"/animals/filter")
end
