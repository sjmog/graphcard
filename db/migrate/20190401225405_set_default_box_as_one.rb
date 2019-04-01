class SetDefaultBoxAsOne < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :box, :integer, default: 1
  end
end
