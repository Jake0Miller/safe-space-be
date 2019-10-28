class Mutations::EditItemMutation < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :center_id, Integer, required: true
  argument :quantity, Integer, required: true

  field :item, Types::ItemType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    item = CenterItem.find_by(item_id: attributes[:id], center_id: attributes[:center_id])
    if item
      item.update(quantity: attributes[:quantity])
      { item: item }
    else
      { errors: item.errors.full_messages }
    end
  end
end
