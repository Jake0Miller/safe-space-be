require 'rails_helper'

RSpec.describe CenterItem, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :quantity}
  end

  describe 'Relationships' do
    it {should belong_to :center}
    it {should belong_to :item}
  end
end