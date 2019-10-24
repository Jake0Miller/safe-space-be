module Types
  class QueryType < Types::BaseObject
    field :items, [Types::ItemType], null: false

    def items
      Item.all
    end

    field :centers, [Types::CenterType], null: false

    def centers
      Center.all
    end

    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :users_at_center, [Types::UserType], null: false do
      argument :center_id, Integer, required: false
    end

    def users_at_center(center_id:)
      User.where(center_id: center_id)
    end
  end
end
