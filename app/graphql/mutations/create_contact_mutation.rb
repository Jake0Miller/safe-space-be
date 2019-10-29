require 'twilio-ruby'

class Mutations::CreateContactMutation < Mutations::BaseMutation
  argument :name, String, required: true
  argument :phone, String, required: true
  argument :user_id, Integer, required: true
  argument :notify, Boolean, required: true

  field :contact, Types::ContactType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    contact = Contact.new(attributes)
    if contact.save
      if attributes[:notify]
        client = Twilio::REST::Client.new ENV['T_SID'], ENV['T_KEY']
        message = client.messages.create(
            body: "#{contact.user.name} just checked in at a relief center.",
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
