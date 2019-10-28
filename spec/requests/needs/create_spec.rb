require 'rails_helper'

describe 'POST need' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @user_1 = @center_1.users.create!(name: 'Jake')

    expect(Need.count).to eq(0)
  end

  it 'I can create a new need' do
    mutation = %(mutation {
                  createNeed (
                      name: "insulin"
                      userId: #{@user_1.id}
                    ) {
                    need {
                      id
                      name
                      userId
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    needs = Need.all
    data_need = needs.first

    expect(needs.length).to eq(1)

    need = JSON.parse(response.body, symbolize_names: true)[:data][:createNeed][:need]

    expect(need[:id]).to eq(data_need.id.to_s)
    expect(need[:name]).to eq(data_need.name)
    expect(need[:name]).to eq('insulin')
  end
end
