require 'rails_helper'

describe 'POST user' do
  before :each do
    expect(User.count).to eq(0)
  end

  it 'I can create a new user' do
    mutation = %(mutation {
                  createUser (
                      name: "Jake"
                    ) {
                    user {
                      id
                      name
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    users = User.all
    data_user = users.first

    expect(users.length).to eq(1)

    user = JSON.parse(response.body, symbolize_names: true)[:data][:createUser][:user]

    expect(user[:id]).to eq(data_user.id.to_s)
    expect(user[:name]).to eq(data_user.name)
    expect(user[:address]).to eq('Jake')
  end
end
