class Center < ApplicationRecord
  validates_presence_of :name, :address, :lat, :lng,
                        :phone, :email, :website
  has_many :center_items
  has_many :items, through: :center_items
  has_many :users
  has_many :needs, through: :users
end
