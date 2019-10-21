class CenterItem < ApplicationRecord
  validates_presence_of :quantity
  belongs_to :center
  belongs_to :item
end