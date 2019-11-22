class ChangeDataUIdToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :u_id, :string
  end
end
