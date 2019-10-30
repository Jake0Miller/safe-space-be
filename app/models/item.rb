class Item < ApplicationRecord
  validates_presence_of :name
  validates_inclusion_of :consumable, :in => [true, false]
  has_many :center_items, :dependent => :delete_all
  has_many :centers, through: :center_items
end
