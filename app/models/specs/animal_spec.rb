require('minitest/autorun')
require('minitest/rg')

require_relative('../Animal.rb')

class AnimalTest < MiniTest::Test

  def test_init_options()
    animal = Animal.new({
      "name" => "Aurimas",
      "image_url" => "/images/cat-1.jpeg",
      "type" => "cat",
      "admission_date" => "14/12/2019",
      "available_for_adoption" => true
    })
    assert_equal("Aurimas", animal.name())
    assert_equal("/images/cat-1.jpeg", animal.image_url())
    assert_equal("cat", animal.type())
    assert_equal("14/12/2019", animal.admission_date())
    assert_equal(true, animal.available_for_adoption())
    assert_equal(nil, animal.owner_id())
  end

  def test_crud()
    original_animals_amount = Animal.all().count()
    animal = Animal.new({
      "name" => "Aurimas",
      "image_url" => "/images/cat-1jpeg",
      "type" => "cat",
      "admission_date" => "14/12/2019",
      "available_for_adoption" => true
    })
    animal.save()
    assert_equal(original_animals_amount + 1, Animal.all().count())
    assert_equal(animal.id(), Animal.find_by_id(animal.id()).id())
    animal.name = "Test"
    animal.update()
    assert_equal("Test", Animal.find_by_id(animal.id()).name())
    animal.delete()
    assert_equal(original_animals_amount, Animal.all().count())
  end

end
