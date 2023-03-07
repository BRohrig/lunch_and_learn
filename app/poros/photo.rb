# frozen_string_literal: true

class Photo
  attr_reader :alt_tag,
              :url
              

  def initialize(input)
    @url = input[:urls][:raw]
    @alt_tag = input[:alt_description]
  end
end
