class Mutations::CreateContactMutation < Mutations::BaseMutation
  argument :name, String, required: true
  argument :phone, String, required: true
  argument :user_id, Integer, required: true

  field :contact, Types::ContactType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    contact = Contact.new(attributes)
    if contact.save
      { contact: contact }
    else
      { errors: contact.errors.full_messages }
    end
  end
end
