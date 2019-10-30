class Mutations::DeleteItemMutation < Mutations::BaseMutation
  argument :id, ID, required: true

  field :item, Types::ItemType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    item = Item.find(attributes[:id])
    if item
      Item.destroy(attributes.values)
      { item: item }
    else
      { errors: item.errors.full_messages }
    end
  end
end
