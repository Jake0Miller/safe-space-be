require 'rails_helper'

describe 'GET items' do
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

  it 'I can get all centers' do
    query = { "query" => "{
              items {
                id
                name
              }
            }" }
    post '/graphql', params: query

    items = JSON.parse(response.body, symbolize_names: true)[:data][:items]

    expect(response.status).to eq(200)
    expect(items.length).to eq(5)
    items.each_with_index do |item,i|
      expect(item[:id]).to eq(@items[i].id.to_s)
      expect(item[:name]).to eq(@items[i].name)
    end
  end
end
