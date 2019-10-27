require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :phone}
    it {should validate_presence_of :user}
  end

  describe 'Relationships' do
    it {should belong_to :user}
  end
end
