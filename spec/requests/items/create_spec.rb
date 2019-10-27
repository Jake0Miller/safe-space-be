require 'rails_helper'

describe 'POST item' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    expect(Item.count).to eq(0)
  end

  it 'I can create a new item' do
    mutation = %(mutation {
                  createItem (
                      name: "food"
                      quantity: 11
                      consumable: true
                      centerId: #{@center_1.id}
                    ) {
                    item {
                      id
                      name
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    items = Item.all
    data_item = items.first

    expect(items.length).to eq(1)

    item = JSON.parse(response.body, symbolize_names: true)[:data][:createItem][:item]

    expect(item[:id]).to eq(data_item.id.to_s)
    expect(item[:name]).to eq(data_item.name)
    expect(item[:name]).to eq('food')

    center_item = CenterItem.first

    expect(center_item.quantity).to eq(11)
    expect(center_item.center).to eq(@center_1)
    expect(center_item.item).to eq(data_item)
  end
end
