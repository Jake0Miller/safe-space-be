class Mutations::DeleteUserMutation < Mutations::BaseMutation
  argument :id, ID, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    user = User.delete(attributes.values)
    if user > 0
      { success: "User deleted successfully" }
    else
      { errors: user.errors.full_messages }
    end
  end
end
