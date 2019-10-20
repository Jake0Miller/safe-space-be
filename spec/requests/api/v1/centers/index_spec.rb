require 'rails_helper'

describe 'GET /api/v1/centers' do
  before :each do
    request_body = { "address": "1331,17th,St,Denver,CO,80202",
      "phone": "5555555555",
      "website": "www.relief-center.com",
      "email": "get-relief@this-center.com", }
  end

  it 'I can create a new center' do

    post '/api/v1/centers', params: request_body.to_json, headers: @headers

    centers = Center.all

    expect(centers.length).to eq(1)

    center = centers.last

    expect(center.address).to eq(request_body[:address])
    expect(center.phone).to eq(request_body[:phone])
    expect(center.email).to eq(request_body[:email])
    expect(center.website).to eq(request_body[:website])
    expect(center.lat).to eq("39.7508132")
    expect(center.lng).to eq("-104.9967997")

    center = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(center[:address]).to eq(request_body[:address])
    expect(center[:phone]).to eq(request_body[:phone])
    expect(center[:email]).to eq(request_body[:email])
    expect(center[:website]).to eq(request_body[:website])
    expect(center[:lat]).to eq("39.7508132")
    expect(center[:lng]).to eq("-104.9967997")
  end
end
