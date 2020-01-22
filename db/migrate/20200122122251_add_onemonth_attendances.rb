class AddOnemonthAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :one_app_n, :string
    add_column :attendances, :one_change_b, :string, default: 0
  end
end
