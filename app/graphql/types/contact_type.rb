module Types
  class ContactType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :phone, String, null: false
    field :notify, Boolean, null: false
    field :user, UserType, null: false
    field :user_id, Integer, null: false

    def user
      object.user
    end
  end
end
