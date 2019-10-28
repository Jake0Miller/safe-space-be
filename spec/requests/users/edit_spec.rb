require 'rails_helper'

describe 'EDIT user' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @user_1 = @center_1.users.create(name: 'Jake')
  end

  it 'I can edit a user' do
    mutation = %(mutation {
                  editUser(id: #{@user_1.id}, phone: "555-555-5555") {
                    user {
                      id
                      name
                      phone
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    user = JSON.parse(response.body, symbolize_names: true)[:data][:editUser][:user]
    
    expect(user[:id]).to eq(@user_1.id.to_s)
    expect(user[:name]).to eq(@user_1.name)
    expect(user[:phone]).to eq(@user_1.reload.phone)
    expect(user[:phone]).to eq("555-555-5555")
  end
end
