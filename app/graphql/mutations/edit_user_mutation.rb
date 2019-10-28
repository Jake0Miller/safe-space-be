class Mutations::EditUserMutation < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :phone, String, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    user = User.find_by(id: attributes[:id])
    if user
      user.update(attributes)
      { user: user }
    else
      { errors: user.errors.full_messages }
    end
  end
end
