class AddOvertimeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime, :datetime
    add_column :attendances, :overtime_application, :integer
    add_column :attendances, :overtime_note, :string
  end
end
