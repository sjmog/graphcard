class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cards

  def self.due_cards
    all.reject { |user| user.cards_due.empty? }
  end

  def cards_due
    cards.due
  end
end
