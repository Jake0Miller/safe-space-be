module Types
  class NeedType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :user, UserType, null: false
    field :user_id, ID, null: false

    def user
      object.user
    end
  end
end
