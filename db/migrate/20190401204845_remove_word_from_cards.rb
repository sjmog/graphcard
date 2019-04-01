class RemoveWordFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :word, :string
  end
end
