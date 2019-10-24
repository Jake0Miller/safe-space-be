class User < ApplicationRecord
  validates_presence_of :name
  belongs_to :center
end
