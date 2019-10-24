require 'rails_helper'

describe 'GET users' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @center_2 = FactoryBot.create(:center)
    @centers = [@center_1, @center_2]
    FactoryBot.create_list(:user, 5)
    @users = User.all

    expect(@users.length).to eq(5)
  end

  it 'I can get all users and their center' do
    query = { "query" => "{
              users {
                id
                name
                center {
                  id
                  addressPrint
                }
              }
            }" }

    post '/graphql', params: query

    users = JSON.parse(response.body, symbolize_names: true)[:data][:users]

    expect(users.length).to eq(5)
    users.each_with_index do |user,i|
      expect(user[:id]).to eq(@users[i].id.to_s)
      expect(user[:name]).to eq(@users[i].name)
      expect(user[:center][:id]).to eq(@users[i].center.id.to_s)
    end
  end
end
