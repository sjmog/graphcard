class AddQuestionToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :question, :string, limit: 200
  end
end
