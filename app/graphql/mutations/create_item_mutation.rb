module Mutations
  class CreateItemMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :quantity, Integer, required: true
    argument :center_id, Integer, required: true

    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      item = Item.new(name: attributes[:name])
      if item.save
        CenterItem.create(item: item, quantity: attributes[:quantity], center_id: attributes[:center_id])
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
