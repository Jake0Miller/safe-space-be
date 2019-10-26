require 'rails_helper'

describe 'DELETE user' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @user_1 = User.create(name: 'Jake', center: @center_1)

    expect(User.count).to eq(1)
  end

  it 'I can create a new user' do
    mutation = %(mutation {
                  deleteUser (
                      id: #{@user_1.id}
                    )
                  }
                })

    post '/graphql', params: { "query" => mutation }

    expect(User.count).to eq(0)
  end
end
