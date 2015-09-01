require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "John", email: "john@email.com")
  end
  
  test "Chef should be valid" do
    assert @chef.valid?
  end
  
  test "Chef name should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "Chef name should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "Chef name should not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "Email must be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "Email address must be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "Email should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "Email validation should accept valid email addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.au first.last@email.com jack+jill@email.com]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "Email validation should reject valid email addresses" do
    invalid_addresses = %w[user@eee,com user_at_ee.org user.name@something eee@i_am_.com foo@three+oak.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end
  
  
  
end