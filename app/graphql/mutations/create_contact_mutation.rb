require 'twilio-ruby'

class Mutations::CreateContactMutation < Mutations::BaseMutation
  argument :name, String, required: true
  argument :phone, String, required: true
  argument :user_id, Integer, required: true
  argument :send, Boolean, required: true

  field :contact, Types::ContactType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    contact = Contact.new(attributes)
    if contact.save
      if attributes[:send]
        client = Twilio::REST::Client.new ENV['T_SID'], ENV['T_KEY']
        message = client.messages.create(
            body: "Hello from Ruby",
            to: "+1#{attributes[:phone]}",
            from: "+13345680005")
        render json: 'Message sent successfully'
      end
      { contact: contact }
    else
      { errors: contact.errors.full_messages }
    end
  end
end
