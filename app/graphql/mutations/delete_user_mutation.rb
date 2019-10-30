class Mutations::DeleteUserMutation < Mutations::BaseMutation
  argument :id, ID, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    user = User.find(attributes[:id])
    if user
      User.destroy(attributes.values)
      { user: user }
    else
      { errors: user.errors.full_messages }
    end
  end
end
