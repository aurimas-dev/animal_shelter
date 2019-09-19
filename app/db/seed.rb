require('pry-byebug')

require_relative('../models/Owner.rb')

Owner.delete_all()

owner1 = Owner.new({"name" => "Aurimas"})
owner1.save()

owner2 = Owner.new({"name" => "Colin"})
owner2.save()

owner3 = Owner.new({"name" => "Niall"})
owner3.save()

owner4 = Owner.new({"name" => "Jordan"})
owner4.save()

binding.pry()
nil
