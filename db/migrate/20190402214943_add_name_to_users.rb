class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, limit: 100, default: "J. Random User"
  end
end
