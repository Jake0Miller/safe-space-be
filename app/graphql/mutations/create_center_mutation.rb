module Mutations
  class CreateCenterMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :address, String, required: true
    argument :phone, String, required: true
    argument :website, String, required: true
    argument :email, String, required: true

    field :center, Types::CenterType, null: true
    field :errors, [String], null: false

    def resolve(**attributes)
      coords = Geocoder.new(attributes[:address]).coords
      center = Center.new(attributes.merge(lat: coords[:lat], lng: coords[:lng]))
      if center.save
        { center: center }
      else
        { errors: center.errors.full_messages }
      end
    end
  end
end
