# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes facade' do
  it 'creates recipe poros out of the returned hash', :vcr do
    recipes = RecipesFacade.get_recipes_by_country('Norway')
    expect(recipes).to be_an(Array)
    recipes.each do |recipe|
      expect(recipe).to be_a(Recipe)
    end
    expect(recipes[0].title).to eq('The White Gold of Norway?!')
    expect(recipes[0].country).to eq('Norway')
    expect(recipes[0].url).to eq('http://honestcooking.com/the-white-gold-of-norway/')
  end
end
