class User < ApplicationRecord
  validates_presence_of :name
  validates_inclusion_of :privacy, :in => [true, false]
  belongs_to :center
  has_many :needs, :dependent => :delete_all
  has_many :contacts, :dependent => :delete_all
end
