class Card < ApplicationRecord
  acts_as_taggable

  def self.random
    Card.find(Card.pluck(:id).sample)
  end
end
