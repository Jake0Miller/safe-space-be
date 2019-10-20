require 'rails_helper'

describe 'POST /api/v1/centers' do
  before :each do
    # stub_json("https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['key']}",
    #   "./fixtures/coords.json")
    # stub_json("https://maps.googleapis.com/maps/api/geocode/json?address=denver,ia&key=#{ENV['key']}",
    #   "./fixtures/alt_coords.json")

    headers = {'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'}

    expect(Center.count).to eq(0)

    request_body = { "address": "1331 17th St, Denver, CO 80202",
                     "phone": "5555555555",
                     "website": "www.relief-center.com",
                     "email": "get-relief@this-center.com", }

    post '/api/v1/centers', params: request_body.to_json, headers: headers
  end

  it 'I can create a new center' do
    response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(response.status).to eq 201
    expect(Center.count).to eq(1)
  end
end
