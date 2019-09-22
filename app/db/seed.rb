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
  "name" => "Adam",
  "type" => "cat",
  "image_url" => "/images/cat-1.jpeg",
  "admission_date" => "19/09/2019",
  "available_for_adoption" => false
})
animal1.save()

animal2 = Animal.new({
  "name" => "Christopher",
  "type" => "cat",
  "image_url" => "/images/cat-2.jpeg",
  "admission_date" => "18/09/2019",
  "available_for_adoption" => false
})
animal2.save()

animal3 = Animal.new({
  "name" => "Nathan",
  "type" => "dog",
  "image_url" => "/images/dog-1.jpeg",
  "admission_date" => "11/09/2019",
  "available_for_adoption" => true
})
animal3.save()

animal4 = Animal.new({
  "name" => "Sreenandini",
  "type" => "cat",
  "image_url" => "/images/cat-3.jpeg",
  "admission_date" => "14/09/2019",
  "available_for_adoption" => false
})
animal4.save()

animal5 = Animal.new({
  "name" => "Eric",
  "type" => "hamster",
  "image_url" => "/images/hamster-1.jpeg",
  "admission_date" => "17/09/2019",
  "available_for_adoption" => true
})
animal5.save()

animal6 = Animal.new({
  "name" => "Paul",
  "type" => "hamster",
  "image_url" => "/images/hamster-2.jpeg",
  "admission_date" => "28/09/2019",
  "available_for_adoption" => false
})
animal6.save()

animal7 = Animal.new({
  "name" => "Geraldine",
  "type" => "cat",
  "image_url" => "/images/cat-4.jpeg",
  "admission_date" => "25/09/2019",
  "available_for_adoption" => true
})
animal7.save()

animal8 = Animal.new({
  "name" => "Stan",
  "type" => "dog",
  "image_url" => "/images/dog-2.jpeg",
  "admission_date" => "8/09/2019",
  "available_for_adoption" => true
})
animal8.save()

animal9 = Animal.new({
  "name" => "Kevin",
  "type" => "dog",
  "image_url" => "/images/dog-3.jpeg",
  "admission_date" => "7/09/2019",
  "available_for_adoption" => true
})
animal9.save()

animal10 = Animal.new({
  "name" => "Rebecca",
  "type" => "dog",
  "image_url" => "/images/dog-4.jpeg",
  "admission_date" => "17/09/2019",
  "available_for_adoption" => false
})
animal10.save()

animal11 = Animal.new({
  "name" => "Aurimas",
  "type" => "grumpy cat",
  "image_url" => "/images/cat-5.jpeg",
  "admission_date" => "20/09/2019",
  "available_for_adoption" => true
})
animal11.save()

animal12 = Animal.new({
  "name" => "Sarah",
  "type" => "cat",
  "image_url" => "/images/cat-6.jpeg",
  "admission_date" => "1/09/2019",
  "available_for_adoption" => true
})
animal12.save()

animal1.assign_owner(owner1.id())

binding.pry()
nil
