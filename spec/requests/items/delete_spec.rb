require 'rails_helper'

describe 'DELETE item' do
  before :each do
    @center_1 = FactoryBot.create(:center)
    @item_1 = Item.create(name: 'food', consumable: true)
    @center_item_1 = CenterItem.create(center: @center_1, item: @item_1)

    expect(Item.count).to eq(1)
    expect(@center_item_1.quantity).to eq(0)
    expect(CenterItem.count).to eq(1)
  end

  it 'I can delete an item' do
    mutation = %(mutation {
                  deleteItem(id: #{@item_1.id}) {
                    item {
                      id
                      name
                    }
                  }
                })

    post '/graphql', params: { "query" => mutation }

    expect(Item.count).to eq(0)
    expect(CenterItem.count).to eq(0)
  end
end
