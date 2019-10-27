class Types::QueryType < Types::BaseObject
  field :items, [Types::ItemType], null: false

  def items
    Item.all
  end

  field :items_at_center, [Types::ItemType], null: false do
    argument :center_id, Integer, required: true
  end

  def items_at_center(center_id:)
    Item.joins(:centers)
      .select('items.*, center_items.quantity')
      .where(centers: {id: center_id})
  end

  field :centers, [Types::CenterType], null: false

  def centers
    Center.all
  end

  field :contacts, [Types::ContactType], null: false

  def contacts
    Contact.all
  end

  field :needs, [Types::NeedType], null: false

  def needs
    Need.all
  end

  field :users, [Types::UserType], null: false

  def users
    User.all
  end

  field :user, Types::UserType, null: false do
    argument :id, ID, required: true
  end

  def user(id:)
    User.find(id)
  end

  field :users_at_center, [Types::UserType], null: false do
    argument :center_id, Integer, required: true
  end

  def users_at_center(center_id:)
    User.where(center_id: center_id)
  end
end
