require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: "Spaghetti", summary: "This is my Sicilian grandmother's spaghetti Recipe.", description: "Put raw spaghetti in boiling water.  Place all contents of sauce in small pot.")  
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
end
