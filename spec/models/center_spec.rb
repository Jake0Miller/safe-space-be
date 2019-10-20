require 'rails_helper'

RSpec.describe Center, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :address}
    it {should validate_presence_of :lat}
    it {should validate_presence_of :lng}
    it {should validate_presence_of :email}
    it {should validate_presence_of :phone}
    it {should validate_presence_of :website}
  end

  describe 'Relationships' do
    # it {should have_one :image}
  end
end
