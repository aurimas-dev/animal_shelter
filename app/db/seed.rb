require('pry-byebug')

require_relative('../models/Owner.rb')
require_relative('../models/Animal.rb')

Owner.delete_all()
Animal.delete_all()

owner1 = Owner.new({"name" => "Colin"})
owner1.save()

owner2 = Owner.new({"name" => "Niall"})
owner2.save()

owner3 = Owner.new({"name" => "Jordan"})
owner3.save()

animal1 = Animal.new({
  "name" => "Tom",
  "type" => "cat",
  "image_url" => "/images/cat-1.jpeg",
  "admission_date" => "19/09/2019",
  "available_for_adoption" => false
})
animal1.save()

animal2 = Animal.new({
  "name" => "Jerry",
  "type" => "cat",
  "image_url" => "/images/cat-2.jpeg",
  "admission_date" => "18/09/2019",
  "available_for_adoption" => false
})
animal2.save()

animal3 = Animal.new({
  "name" => "Ben",
  "type" => "dog",
  "image_url" => "/images/dog-1.jpeg",
  "admission_date" => "11/09/2019",
  "available_for_adoption" => true
})
animal3.save()

animal4 = Animal.new({
  "name" => "Whiskers",
  "type" => "cat",
  "image_url" => "/images/cat-3.jpeg",
  "admission_date" => "14/09/2019",
  "available_for_adoption" => false
})
animal4.save()

animal5 = Animal.new({
  "name" => "Jimmy",
  "type" => "hamster",
  "image_url" => "/images/hamster-1.jpeg",
  "admission_date" => "17/09/2019",
  "available_for_adoption" => true
})
animal5.save()

animal1.assign_owner(owner1.id())

binding.pry()
nil
