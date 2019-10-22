require 'rails_helper'

describe 'GET /api/v1/items' do
  it 'I can get all items' do
    FactoryBot.create_list(:item, 5)
    items = Item.all
    expect(items.length).to eq(5)

    get '/api/v1/items'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(items.length).to eq(5)

    expect(items.first.keys).to include(:name)
  end
end
