require 'rails_helper'

describe 'GET users' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @center_2 = FactoryBot.create(:center)
    @user_1 = User.create(name: 'Jake', center: @center_1)
    @user_2 = User.create(name: 'Jacob', center: @center_1)
    @user_3 = User.create(name: 'Sarah', center: @center_2)
    @user_4 = User.create(name: 'Ann', center: @center_2)
    @user_5 = User.create(name: 'Pam', center: @center_2)
    @fe_users = [@user_3, @user_4, @user_5]
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

  it 'I can get all users that belong to a center' do
    query = { "query" => "{
              usersAtCenter(centerId: #{@center_2.id}) {
                id
                name
              }
            }" }

    post '/graphql', params: query

    users = JSON.parse(response.body, symbolize_names: true)[:data][:usersAtCenter]
    
    expect(users.length).to eq(3)
    users.each_with_index do |user,i|
      expect(user[:id]).to eq(@fe_users[i].id.to_s)
      expect(user[:name]).to eq(@fe_users[i].name)
    end
  end
end
