require 'rails_helper'

describe 'DELETE user' do
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
                      quantity
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    expect(@center_item_1.reload.quantity).to eq(10)
  end
end
