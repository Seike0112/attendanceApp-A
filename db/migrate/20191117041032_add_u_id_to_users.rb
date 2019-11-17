class AddUIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :u_id, :integer
  end
end
