module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :centers, [CenterType], null: false

    def centers
      Center.joins(:users)
        .select('centers.*, center_items.quantity')
        .where(users: {id: object.id})
    end
  end
end
