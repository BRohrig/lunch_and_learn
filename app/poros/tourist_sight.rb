class TouristSight
  attr_reader :id, :name, :address, :place_id
  
  def initialize(input_data)
    @name = input_data[:properties][:name]
    @address = input_data[:properties][:address_line2]
    @place_id = input_data[:place_id]
    @id = "null"
  end
end