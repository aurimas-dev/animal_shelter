require('pry-byebug')

require_relative('../models/Animal.rb')
require_relative('../models/Owner.rb')

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/animals/new' do
  erb(:"animals/new")
end

post '/animals' do
  animal = Animal.new(params)
  animal.save()
  redirect to('/animals')
end

get '/animals/:id' do
  @animal = Animal.find_by_id(params['id'].to_i())
  @owner = Owner.find_by_id(@animal.owner_id())
  erb(:"animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find_by_id(params['id'].to_i())
  @owners = Owner.all_without_animal()
  @owners.push(Owner.find_by_id(@animal.owner_id())) if @animal.has_owner?()
  erb(:"animals/edit")
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.update()
  animal.assign_owner(params['owner_id'])
  redirect to("/animals/#{params['id']}")
end

post '/animals/:id/delete' do
  animal = Animal.find_by_id(params['id'].to_i())
  animal.delete()
  redirect to("/animals")
end

get '/animals/filters/available' do
  @animals = Animal.all_available_for_adoption()
  erb(:"/animals/filters/available")
end
