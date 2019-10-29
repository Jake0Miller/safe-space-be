require 'twilio-ruby'

class TwilioController < ApplicationController
  def new
    client = Twilio::REST::Client.new ENV['T_SID'], ENV['T_KEY']
    message = client.messages.create(
        body: "Hello from Ruby",
        to: "+19208502210",    # Replace with your phone number
        from: "+13345680005")  # Use this Magic Number for creating SMS
    render json: 'Message sent successfully'
  end
end
