class Mutations::CreateNeedMutation < Mutations::BaseMutation
  argument :name, String, required: true
  argument :user_id, Integer, required: true

  field :need, Types::NeedType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    need = Need.new(attributes)
    if need.save
      { need: need }
    else
      { errors: need.errors.full_messages }
    end
  end
end
