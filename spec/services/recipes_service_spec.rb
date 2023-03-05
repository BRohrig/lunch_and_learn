# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes service' do
  it 'can get back all the recipes from edamam that match a country search', :vcr do
    norway_response = RecipesService.get_recipes_by_country('Norway')
    expect(norway_response[:hits]).to be_an(Array)

    norway_response[:hits].each do |recipe|
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
