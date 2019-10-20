require 'rails_helper'

describe 'GET /api/v1/centers' do
  before :each do
    FactoryBot.create_list(:center, 5)
    @centers = Center.all
    expect(@centers.length).to eq(5)
  end

  it 'I can get all new centers' do
    get '/api/v1/centers'

    centers = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(centers.length).to eq(5)

    # expect(center[:address]).to eq(request_body[:address])
    # expect(center[:phone]).to eq(request_body[:phone])
    # expect(center[:email]).to eq(request_body[:email])
    # expect(center[:website]).to eq(request_body[:website])
    # expect(center[:lat]).to eq("39.7508132")
    # expect(center[:lng]).to eq("-104.9967997")
  end
end
