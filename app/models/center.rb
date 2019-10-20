class Center < ApplicationRecord
  validates_presence_of :address, :lat, :lng,
                        :phone, :email, :website
  has_many :center_items
  has_many :items, through: :center_items
end
