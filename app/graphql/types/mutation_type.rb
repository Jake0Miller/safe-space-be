module Types
  class MutationType < Types::BaseObject
    field :create_center, mutation: Mutations::CreateCenterMutation
  end
end
