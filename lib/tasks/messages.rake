namespace :messages do
  desc "Sends a reminder message to a user"
  task reminders: :environment do
    client = Twilio::REST::Client.new

    User.due_cards.each do |user|
      if user.phone_number
        client.messages.create({
          from: ENV["TWILIO_PHONE_NUMBER"],
          to:   user.phone_number,
          body: "You have #{ActionController::Base.helpers.pluralize(user.cards_due.count, 'card')} due!\n\nhttps://graphcard.herokuapp.com/learn"
        })
      end
    end
  end

end
