class AddOvertimeNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :overtime_n, :string
  end
end
