# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  validates_presence_of :country, :recipe_link, :recipe_title, :user_id
end
