class AddEditoneAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :edit_next_d, :boolean, default: false
    add_column :attendances, :edit_app_n, :string
    add_column :attendances, :edit_start, :datetime
    add_column :attendances, :edit_finish, :datetime
    add_column :attendances, :edit_note, :string
    add_column :attendances, :edit_app_s, :string
    add_column :attendances, :edit_change_b, :boolean, default: "0"
  end
end
