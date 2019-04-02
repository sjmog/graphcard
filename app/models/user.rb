class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cards

  after_create :send_intro_sms_to_user, if: :phone_number_exists?

  def self.due_cards
    all.reject { |user| user.cards_due.empty? }
  end

  def cards_due
    cards.due
  end

  def phone_number_exists?
    !!phone_number
  end

  def send_intro_sms_to_user
    client = Twilio::REST::Client.new

    client.messages.create({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to:   phone_number,
      body: "Welcome to Graphcard, #{name}! This is an automated message.\n\nI'll message you daily at 1300 with any cards to cover. You can create new cards via the web UI at https://graphcard.herokuapp.com, or you can reply to this message to create new cards. Simply add a delimiting '|' character between the question, the answer, and (optionally), a comma-separated list of tags. For instance:\n\nWhat's my name?|#{name}|personal, test\n\nHappy Graphcarding!"
    })
  end
end
