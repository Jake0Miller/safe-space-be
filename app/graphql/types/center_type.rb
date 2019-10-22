module Types
  class CenterType < Types::BaseObject
    field :id, ID, null: false
    field :address, String, null: false
    field :email, String, null: false
    field :website, String, null: false
    field :phone, String, null: false
    field :lat, String, null: false
    field :lng, String, null: false
    field :address_print, String, null: false
    field :items, [ItemType], null: false
    field :quantity, Integer, null: false

    def address_print
      object.address.gsub(',', ' ')
    end

    def items
      Item.joins(:centers)
        .select('items.*, center_items.quantity')
        .where(centers: {id: object.id})
    end
  end
end
