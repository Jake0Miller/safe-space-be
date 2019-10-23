require 'rails_helper'

describe 'GET /api/v1/centers' do
  before :each do
    FactoryBot.create_list(:center, 5)
    @centers = Center.all
    expect(@centers.length).to eq(5)
  end

  it 'I can get all centers' do
    get '/api/v1/centers'

    centers = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(centers.length).to eq(5)

    keys = centers.first.keys
    expect(keys).to include(:name)
    expect(keys).to include(:address)
    expect(keys).to include(:phone)
    expect(keys).to include(:lat)
    expect(keys).to include(:lng)
    expect(keys).to include(:email)
    expect(keys).to include(:website)
  end
end
