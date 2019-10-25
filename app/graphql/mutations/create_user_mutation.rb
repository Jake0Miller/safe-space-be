module Mutations
  class CreateUserMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :age, String, required: false
    argument :phone, String, required: false
    argument :center_id, Integer, required: true

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