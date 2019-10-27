class Contact < ApplicationRecord
  validates_presence_of :name, :phone, :user
  belongs_to :user
end
