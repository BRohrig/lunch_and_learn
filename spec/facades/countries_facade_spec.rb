require 'rails_helper'

RSpec.describe 'countries facade' do
  it 'can create an array of the names of all countries' do
    countries_list = CountriesFacade.country_names
    expect(countries_list).to be_an(Array)
    expect(countries_list.count).to eq(250)
    expect(countries_list).to include("England")
    expect(countries_list).to include("Zambia")
    expect(countries_list).to include("New Zealand")
  end


end