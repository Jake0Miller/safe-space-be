require 'rails_helper'

describe 'EDIT item' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @item_1 = Item.create(name: 'food', consumable: true)
    @center_item_1 = CenterItem.create(center: @center_1, item: @item_1)

    expect(Item.count).to eq(1)
    expect(@center_item_1.quantity).to eq(0)
    expect(CenterItem.count).to eq(1)
  end

  it 'I can edit an item' do
    mutation = %(mutation {
                  editItem(id: #{@item_1.id}, centerId: #{@center_1.id}, quantity: 10) {
                    item {
                      id
                      quantity
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    center_item = JSON.parse(response.body, symbolize_names: true)[:data][:editItem][:item]

    expect(center_item[:id]).to eq(@center_item_1.id.to_s)
    expect(center_item[:quantity]).to eq(@center_item_1.reload.quantity)
    expect(center_item[:quantity]).to eq(10)
    expect(@center_item_1.reload.quantity).to eq(10)
  end
end
