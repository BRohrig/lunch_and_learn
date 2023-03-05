# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipe poro' do
  it 'exists and has accessible attributes' do
    recipe_data = { recipe: { label: 'This is a delicious muffin',
                              image: 'www.tastypicture.com',
                              url: 'www.deliciousmuffins.com' } }
    recipe = Recipe.new(recipe_data, 'MuffinTown')
    expect(recipe).to be_a(Recipe)
    expect(recipe.id).to eq('null')
    expect(recipe.country).to eq('MuffinTown')
    expect(recipe.title).to eq('This is a delicious muffin')
    expect(recipe.image).to eq('www.tastypicture.com')
    expect(recipe.url).to eq('www.deliciousmuffins.com')
  end
end
