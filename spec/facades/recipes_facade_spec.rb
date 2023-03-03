require 'rails_helper'

RSpec.describe 'recipes facade' do
  it 'returns an array of recipes for a specified country', :vcr do
    recipes = RecipesFacade.get_recipes_by_country("Norway")
    expect(recipes).to be_an(Array)
    recipes.each do |recipe|
      expect(recipe).to have_key(:recipe)
      expect(recipe[:recipe]).to be_a(Hash)
      expect(recipe[:recipe]).to have_key(:uri)
      expect(recipe[:recipe]).to have_key(:label)
      expect(recipe[:recipe]).to have_key(:image)
      expect(recipe[:recipe]).to have_key(:images)
      expect(recipe[:recipe]).to have_key(:source)
      expect(recipe[:recipe]).to have_key(:ingredients)
    end
  end


end