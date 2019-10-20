require 'rails_helper'

RSpec.describe CenterItem, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :quantity}
  end

  describe 'Relationships' do
    # it {should have_one :image}
  end
end