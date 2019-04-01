class AddBoxToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :box, :integer
  end
end
