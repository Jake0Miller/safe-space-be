class Mutations::DeleteUserMutation < Mutations::BaseMutation
  argument :id, ID, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    binding.pry
    user = User.delete(attributes)
    if user.save
      { user: user }
    else
      { errors: user.errors.full_messages }
    end
  end
end
