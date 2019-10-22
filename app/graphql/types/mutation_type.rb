module Types
  class MutationType < Types::BaseObject
    field :test_field, String, null: false,
      description: "An example field added by the generator"
  end
end
