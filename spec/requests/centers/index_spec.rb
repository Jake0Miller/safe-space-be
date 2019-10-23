require 'rails_helper'

describe 'GET centers' do
  before :each do
    FactoryBot.create_list(:item, 5)
    @items = Item.all

    @center_1 = FactoryBot.create(:center)
    @center_2 = FactoryBot.create(:center)
    @centers = [@center_1, @center_2]
    @items.each do |item|
      CenterItem.create!(item: item, center: @center_1)
    end
    CenterItem.create!(item: @items.first, center: @center_2)
    CenterItem.create!(item: @items.last, center: @center_2)

    expect(@items.length).to eq(5)
    expect(Center.count).to eq(2)
    expect(CenterItem.count).to eq(7)
  end

  it 'I can get all centers and their items' do
    query = { "query" => "{
              centers {
                id
                address
                phone
                email
                website
                lat
                lng
                items {
                  id
                  name
                }
              }
            }" }
    post '/graphql', params: query

    centers = JSON.parse(response.body, symbolize_names: true)[:data][:centers]

    expect(response.status).to eq(200)
    expect(centers.length).to eq(2)
    centers.each_with_index do |center,i|
      expect(center[:id]).to eq(@centers[i].id.to_s)
      expect(center[:address]).to eq(@centers[i].address)
      expect(center[:items].first[:id]).to eq(@centers[i].items.first.id.to_s)
    end
  end
end
