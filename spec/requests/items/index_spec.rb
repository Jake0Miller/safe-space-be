require 'rails_helper'

describe 'GET items' do
  before :each do
    FactoryBot.create_list(:item, 5)
    @items = Item.all

    @center_1 = FactoryBot.create(:center)
    @center_2 = FactoryBot.create(:center)
    @centers = [@center_1, @center_2]
    @items.each do |item|
      CenterItem.create!(item: item, center: @center_1, quantity: 7)
    end
    CenterItem.create!(item: @items.first, center: @center_2, quantity: 5)
    CenterItem.create!(item: @items.last, center: @center_2)

    expect(@items.length).to eq(5)
    expect(Center.count).to eq(2)
    expect(CenterItem.count).to eq(7)
  end

  it 'I can get all items and their centers' do
    query = { "query" => "{
              items {
                id
                name
                centers {
                  id
                  addressPrint
                  quantity
                }
              }
            }" }

    post '/graphql', params: query

    items = JSON.parse(response.body, symbolize_names: true)[:data][:items]

    expect(items.length).to eq(5)
    items.each_with_index do |item,i|
      expect(item[:id]).to eq(@items[i].id.to_s)
      expect(item[:name]).to eq(@items[i].name)
      expect(item[:centers].first[:id]).to eq(@items[i].centers.first.id.to_s)
      expect(item[:centers].first[:quantity]).to eq(7)
    end
    expect(items.first[:centers].last[:quantity]).to eq(5)
    expect(items.last[:centers].last[:quantity]).to eq(0)
  end

  it 'I can get all items for a specific center' do
    query = { "query" => "{
              itemsAtCenter(centerId: #{@center_1.id}) {
                id
                name
                quantity
              }
            }" }

    post '/graphql', params: query

    items = JSON.parse(response.body, symbolize_names: true)[:data][:itemsAtCenter]

    expect(items.length).to eq(5)
    items.each_with_index do |item,i|
      expect(item[:id]).to eq(@items[i].id.to_s)
      expect(item[:name]).to eq(@items[i].name)
      expect(item[:quantity]).to eq(7)
    end

    query = { "query" => "{
              itemsAtCenter(centerId: #{@center_2.id}) {
                id
                name
                quantity
              }
            }" }

    post '/graphql', params: query

    items = JSON.parse(response.body, symbolize_names: true)[:data][:itemsAtCenter]

    expect(items.length).to eq(2)
    expect(items.first[:id]).to eq(@items.first.id.to_s)
    expect(items.first[:name]).to eq(@items.first.name)
    expect(items.first[:quantity]).to eq(5)
    expect(items.last[:quantity]).to eq(0)
  end
end
