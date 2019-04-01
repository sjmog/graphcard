class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :word, limit: 50
      t.text :content, limit: 200

      t.timestamps
    end
  end
end
