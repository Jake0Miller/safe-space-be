module Types
  class MutationType < Types::BaseObject
    field :create_center, mutation: Mutations::CreateCenterMutation
    field :create_user, mutation: Mutations::CreateUserMutation
    field :create_item, mutation: Mutations::CreateItemMutation
  end
end
