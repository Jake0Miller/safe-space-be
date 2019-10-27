class User < ApplicationRecord
  validates_presence_of :name
  belongs_to :center
  has_many :needs
  has_many :contacts
end
