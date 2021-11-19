require 'rails_helper'

RSpec.describe "food_recipes/show", type: :view do
  before(:each) do
    @food_recipe = assign(:food_recipe, FoodRecipe.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
