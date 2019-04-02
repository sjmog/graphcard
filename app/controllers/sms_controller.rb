class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create_card
    body = params["Body"]
    question = body.split("|")[0]
    answer = body.split("|")[1]
    tag_list = body.split("|")[2]

    user = User.find_by_phone_number(params["From"])

    @card = user.cards.new(question: question, content: answer, tag_list: tag_list)

    if @card.save
      response = Twilio::TwiML::MessagingResponse.new do |resp|
        resp.message(body: "I created a card for you, #{user.name}!\nQuestion: #{question}\nAnswer: #{answer}#{"\nTags: #{tag_list}" if tag_list}\n\nYou can view it here: https://graphcard.herokuapp.com/cards/#{@card.id}")
      end

      render xml: response.to_s
    else
      response = Twilio::TwiML::MessagingResponse.new do |resp|
        resp.message(body: "Sorry, I couldn't create a card. Here's why: #{@card.errors}")
      end

      render xml: response.to_s
    end

  rescue
    response = Twilio::TwiML::MessagingResponse.new do |resp|
      resp.message(body: "Something weird went wrong. Sorry.")
    end

    render xml: response.to_s
  end
end