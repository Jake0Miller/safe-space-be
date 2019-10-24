module Types
  class QueryType < Types::BaseObject
    field :items,
      [Types::ItemType],
      null: false,
      description: "Returns all items in the database"

    def items
      Item.all
    end

    field :centers,
      [Types::CenterType],
      null: false,
      description: "Returns all centers in the database"

    def centers
      Center.all
    end

    field :users,
      [Types::UserType],
      null: false,
      description: "Returns all users in the database"

    def users
      User.all
    end
  end
end
