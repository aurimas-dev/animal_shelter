require('pry-byebug')

require_relative('../models/Owner.rb')
require_relative('../models/Animal.rb')

Owner.delete_all()
Animal.delete_all()

owner1 = Owner.new({"name" => "Aurimas"})
owner1.save()

owner2 = Owner.new({"name" => "Colin"})
owner2.save()

owner3 = Owner.new({"name" => "Niall"})
owner3.save()

owner4 = Owner.new({"name" => "Jordan"})
owner4.save()

animal1 = Animal.new({
  "name" => "Tom",
  "type" => "Cat",
  "admission_date" => "19/09/2019",
  "available_for_adoption" => false
})
animal1.save()

animal2 = Animal.new({
  "name" => "Jerry",
  "type" => "Mouse",
  "admission_date" => "18/09/2019",
  "available_for_adoption" => false
})
animal2.save()

animal3 = Animal.new({
  "name" => "Ben",
  "type" => "Dog",
  "admission_date" => "11/09/2019",
  "available_for_adoption" => true
})
animal3.save()

animal4 = Animal.new({
  "name" => "Whiskers",
  "type" => "Cat",
  "admission_date" => "14/09/2019",
  "available_for_adoption" => false
})
animal4.save()

animal5 = Animal.new({
  "name" => "Jimmy",
  "type" => "Pig",
  "admission_date" => "17/09/2019",
  "available_for_adoption" => true
})
animal5.save()

binding.pry()
nil
