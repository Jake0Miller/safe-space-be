require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :user_id}
  end

  describe 'Relationships' do
    it {should belong_to :user}
  end
end
