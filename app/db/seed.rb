require('pry-byebug')

require_relative('../models/Owner.rb')
require_relative('../models/Animal.rb')

Owner.delete_all()
Animal.delete_all()
Log.delete_all()

owner1 = Owner.new({
  "name" => "Colin",
  "capacity" => 1
})
owner1.save()

owner2 = Owner.new({
  "name" => "Niall",
  "capacity" => 2
})
owner2.save()

owner3 = Owner.new({
  "name" => "Jordan",
  "capacity" => 3
})
owner3.save()

animal1 = Animal.new({
  "name" => "Adam",
  "type" => "cat",
  "image_url" => "/images/cat-1.jpeg",
  "admission_date" => "2019-09-01",
  "available_for_adoption" => false
})
animal1.save()

animal2 = Animal.new({
  "name" => "Christopher",
  "type" => "cat",
  "image_url" => "/images/cat-2.jpeg",
  "admission_date" => "2019-09-03",
  "available_for_adoption" => false
})
animal2.save()

animal3 = Animal.new({
  "name" => "Nathan",
  "type" => "dog",
  "image_url" => "/images/dog-1.jpeg",
  "admission_date" => "2019-09-22",
  "available_for_adoption" => true
})
animal3.save()

animal4 = Animal.new({
  "name" => "Sreenandini",
  "type" => "cat",
  "image_url" => "/images/cat-3.jpeg",
  "admission_date" => "2019-08-29",
  "available_for_adoption" => false
})
animal4.save()

animal5 = Animal.new({
  "name" => "Eric",
  "type" => "hamster",
  "image_url" => "/images/hamster-1.jpeg",
  "admission_date" => "2019-08-10",
  "available_for_adoption" => true
})
animal5.save()

animal6 = Animal.new({
  "name" => "Paul",
  "type" => "hamster",
  "image_url" => "/images/hamster-2.jpeg",
  "admission_date" => "2019-07-01",
  "available_for_adoption" => false
})
animal6.save()

animal7 = Animal.new({
  "name" => "Geraldine",
  "type" => "cat",
  "image_url" => "/images/cat-4.jpeg",
  "admission_date" => "2019-06-22",
  "available_for_adoption" => true
})
animal7.save()

animal8 = Animal.new({
  "name" => "Stan",
  "type" => "dog",
  "image_url" => "/images/dog-2.jpeg",
  "admission_date" => "2019-05-11",
  "available_for_adoption" => true
})
animal8.save()

animal9 = Animal.new({
  "name" => "Kevin",
  "type" => "hedgehog",
  "image_url" => "/images/hedgehog-1.jpeg",
  "admission_date" => "2019-07-12",
  "available_for_adoption" => true
})
animal9.save()

animal10 = Animal.new({
  "name" => "Rebecca",
  "type" => "dog",
  "image_url" => "/images/dog-4.jpeg",
  "admission_date" => "2019-08-07",
  "available_for_adoption" => false
})
animal10.save()

animal11 = Animal.new({
  "name" => "Aurimas",
  "type" => "grumpy cat",
  "image_url" => "/images/cat-5.jpeg",
  "admission_date" => "2019-09-01",
  "available_for_adoption" => true
})
animal11.save()

animal12 = Animal.new({
  "name" => "Sarah",
  "type" => "cat",
  "image_url" => "/images/cat-6.jpeg",
  "admission_date" => "2019-10-10",
  "available_for_adoption" => true
})
animal12.save()

animal1.assign_owner(owner1.id())

binding.pry()
nil
