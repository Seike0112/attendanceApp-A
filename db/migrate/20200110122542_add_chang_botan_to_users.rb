class AddChangBotanToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :change, :boolean, default: false
  end
end
