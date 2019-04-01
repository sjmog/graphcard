class AddDefaultToLastViewedAt < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :last_viewed_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
