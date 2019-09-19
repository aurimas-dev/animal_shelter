require('minitest/autorun')
require('minitest/rg')

require_relative('../Owner.rb')

class OwnerTest < MiniTest::Test

  def test_name()
    owner = Owner.new({"name" => "Aurimas"})
    assert_equal("Aurimas", owner.name())
  end

  def test_crud()
    original_owners_amount = Owner.all().count()
    owner = Owner.new({"name" => "Aurimas"})
    owner.save()
    assert_equal(original_owners_amount + 1, Owner.all().count())
    assert_equal(owner.id(), Owner.find_by_id(owner.id()).id())
    owner.name = "Test"
    owner.update()
    assert_equal("Test", Owner.find_by_id(owner.id()).name())
    owner.delete()
    assert_equal(original_owners_amount, Owner.all().count())
  end

end
