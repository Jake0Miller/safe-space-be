class Types::MutationType < Types::BaseObject
  field :create_center, mutation: Mutations::CreateCenterMutation

  field :create_user, mutation: Mutations::CreateUserMutation
  field :delete_user, mutation: Mutations::DeleteUserMutation

  field :create_item, mutation: Mutations::CreateItemMutation
  field :edit_item, mutation: Mutations::EditItemMutation
end
