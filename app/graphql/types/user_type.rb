module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :center, CenterType, null: false

    def center
      object.center
    end

    def centerId

    end
  end
end
