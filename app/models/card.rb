class Card < ApplicationRecord
  acts_as_taggable
  belongs_to :user

  MAX_BOX = 5
  MIN_BOX = 1

  BOX_MOVEMENTS = {
    'Right, and it was easy': 1,
    'Right, but it was effortful': 0,
    'Wrong': -1
  }

  def self.due
    select { |card| card.due? }
  end

  def due?
    (box == 1) ||
    (box == 2 && last_viewed_at <= 24.hours.ago) ||
    (box == 3 && last_viewed_at <= 10.days.ago)  ||
    (box == 4 && last_viewed_at <= 30.days.ago)  ||
    (box == 5 && last_viewed_at <= 60.days.ago)
  end

  def belongs_to?(user)
    user.cards.include?(self)
  end

  def respace(result)
    update(
      box: box + box_modifier(result),
      last_viewed_at: DateTime.now
    )
  end

  def next_repetition
    case box
    when 1
      Time.now
    when 2
      last_viewed_at <= 24.hours.ago ? Time.now : last_viewed_at + 24.hours
    when 3
      last_viewed_at <= 10.days.ago  ? Time.now : last_viewed_at + 10.days
    when 4
      last_viewed_at <= 30.days.ago  ? Time.now : last_viewed_at + 30.days
    when 5
      last_viewed_at <= 60.days.ago  ? Time.now : last_viewed_at + 60.days
    end
  end

  private

  def box_modifier(result)
    proposed_box = box + BOX_MOVEMENTS[result.to_sym]

    return 0 if proposed_box < MIN_BOX || proposed_box > MAX_BOX
    return BOX_MOVEMENTS[result.to_sym]
  end
end
