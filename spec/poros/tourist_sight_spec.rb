require 'rails_helper'

RSpec.describe "tourist sight poro" do
  it 'exists and has accessible attributes' do
    sight = TouristSight.new({properties: {name: "Cool place to visit",
                                          address_line2: "1234 cool place ave"},
                              place_id: "1231512341"})

    expect(sight.id).to eq("null")
    expect(sight.name).to eq("Cool place to visit")
    expect(sight.address).to eq("1234 cool place ave")
    expect(sight.place_id).to eq("1231512341")

  end



end