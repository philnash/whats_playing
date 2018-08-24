class Twilio::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    response = Twilio::TwiML::MessagingResponse.new
    response.message(body: "Hello World!")
    render xml: response.to_xml
  end
end
