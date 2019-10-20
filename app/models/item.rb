class Item < ApplicationRecord
  validates_presence_of :name
  has_many :center_items
  has_many :centers, through: :center_items
end