require "rails_helper"

RSpec.describe Types::QueryType do
  describe "items" do
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

    it "get all items" do
      query = %(query {
                  items {
                    name
                  }
                })

      result = CrossPolBeSchema.execute(query).as_json

      expect(result["data"]["items"].length).to eq(5)
      expect(result["data"]["items"])
        .to match_array(@items.map { |item| { "name" => item.name } })
    end

    it "get all centers" do
      query = %(query {
                  centers {
                    address
                    lat
                    lng
                    email
                    phone
                    website
                  }
                })

      result = CrossPolBeSchema.execute(query).as_json

      expect(result["data"]["centers"].length).to eq(2)
      expect(result["data"]["centers"])
        .to match_array(@centers.map { |center| { "address" => center.address,
                                                  "lat" => center.lat,
                                                  "lng" => center.lng,
                                                  "email" => center.email,
                                                  "phone" => center.phone,
                                                  "website" => center.website }})
    end
  end
end
