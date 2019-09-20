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
  erb(:"animals/edit")
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.update()
  redirect to("/animals/#{params['id']}")
end

post '/animals/:id/delete' do
  animal = Animal.find_by_id(params['id'].to_i())
  animal.delete()
  redirect to("/animals")
end
