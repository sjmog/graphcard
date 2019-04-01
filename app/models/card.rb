class Card < ApplicationRecord
  acts_as_taggable

  MAX_BOX = 5
  MIN_BOX = 1

  BOX_MOVEMENTS = {
    'Right, and it was easy': 1,
    'Right, but it was effortful': 0,
    'Wrong': -1
  }

  def self.random
    Card.find(Card.pluck(:id).sample)
  end

  def respace(result)
    update(
      box: box + box_modifier(result),
      last_viewed_at: DateTime.now
    )
  end

  private

  def box_modifier(result)
    proposed_box = box + BOX_MOVEMENTS[result.to_sym]

    return 0 if proposed_box < MIN_BOX || proposed_box > MAX_BOX
    return BOX_MOVEMENTS[result.to_sym]
  end
end
