require 'rails_helper'

describe 'EDIT user' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @user_1 = User.create(name: 'food')
  end

  it 'I can edit a user' do
    mutation = %(mutation {
                  editUser(id: #{@user_1.id}, phone: "555-555-5555") {
                    user {
                      name
                      phone
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    # expect(@center_item_1.reload.quantity).to eq(10)
  end
end
