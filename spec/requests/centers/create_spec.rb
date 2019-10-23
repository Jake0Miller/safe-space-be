require 'rails_helper'

describe 'POST center' do
  before :each do
    stub_json("https://maps.googleapis.com/maps/api/geocode/json?address=1331,17th,St,Denver,CO,80202&key=#{ENV['GEO_KEY']}",
      "./fixtures/turing_location.json")
    expect(Center.count).to eq(0)
  end

  it 'I can create a new center' do
    mutation = %(mutation {
                  createCenter (
                      address: "1331,17th,St,Denver,CO,80202",
                      phone: "921",
                      website: "https",
                      email: "HOTMAIL.COM"
                    ) {
                    center {
                      id
                      address
                      phone
                      website
                      email
                      lat
                      lng
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    centers = Center.all
    data_center = centers.first

    expect(centers.length).to eq(1)

    center = JSON.parse(response.body, symbolize_names: true)[:data][:createCenter][:center]

    expect(center[:id]).to eq(data_center.id.to_s)
    expect(center[:address]).to eq(data_center.address)

    expect(center[:address]).to eq('1331,17th,St,Denver,CO,80202')
    expect(center[:phone]).to eq('921')
    expect(center[:email]).to eq('HOTMAIL.COM')
    expect(center[:website]).to eq('https')
    expect(center[:lat]).to eq("39.7508132")
    expect(center[:lng]).to eq("-104.9967997")
  end
end
