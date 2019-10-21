require 'rails_helper'

describe 'GET /api/v1/items' do
  before :each do
    FactoryBot.create_list(:item, 5)
    @items = Item.all
    expect(@items.length).to eq(5)
  end

  it 'I can get all items' do
    get '/api/v1/items'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(items.length).to eq(5)

    expect(items.first.keys).to include(:name)
  end
end
