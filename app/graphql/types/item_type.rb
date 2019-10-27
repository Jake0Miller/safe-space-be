module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :consumable, Boolean, null: false
    field :centers, [CenterType], null: false
    field :quantity, Integer, null: false

    def centers
      Center.joins(:items)
        .select('centers.*, center_items.quantity')
        .where(items: {id: object.id})
    end
  end
end
