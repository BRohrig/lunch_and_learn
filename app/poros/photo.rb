class Photo
  attr_reader :url,
              :alt_tag

  def initialize(input)
    # binding.pry
    @url = input[:urls][:raw]
    @alt_tag = input[:alt_description]
  end

end