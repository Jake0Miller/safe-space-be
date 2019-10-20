class Center < ApplicationRecord
  validates_presence_of :address, :lat, :lng, :phone, :email, :website
  # has_one :image
  # has_many :forecasts
end
