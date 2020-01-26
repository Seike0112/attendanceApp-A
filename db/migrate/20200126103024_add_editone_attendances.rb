class AddEditoneAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :edit_next_d, :boolean, default: false
  end
end
