module Types
  class MutationType < Types::BaseObject
    field :create_center, mutation: Mutations::CreateCenterMutation
    field :create_user, mutation: Mutations::CreateUserMutation
  end
end
