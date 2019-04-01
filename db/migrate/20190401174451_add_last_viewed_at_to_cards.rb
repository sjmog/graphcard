class AddLastViewedAtToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :last_viewed_at, :datetime
  end
end
