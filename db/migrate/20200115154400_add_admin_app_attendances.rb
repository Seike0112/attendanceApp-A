class AddAdminAppAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :app_number, :string
    add_column :attendances, :change_button, :string, default: 0
    add_column :attendances, :app_name, :string
  end
end
