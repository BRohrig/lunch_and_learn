# frozen_string_literal: true

class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :recipe_title, :recipe_link, :country, :created_at
end
