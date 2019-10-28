module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :phone, String, null: false
    field :age, Integer, null: false
    field :allergies, Boolean, null: false
    field :diet_restrictions, Boolean, null: false
    field :center, CenterType, null: false

    def center
      object.center
    end
  end
end
