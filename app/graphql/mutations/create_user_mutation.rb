module Mutations
  class CreateUserMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :address, String, required: true
    argument :phone, String, required: true
    argument :website, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      user = User.new(attributes)
      if user.save
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end
