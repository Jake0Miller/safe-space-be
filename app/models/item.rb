class Item < ApplicationRecord
  validates_presence_of :name, :consumable
  has_many :center_items
  has_many :centers, through: :center_items
end
