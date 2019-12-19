class AddOvertimeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime, :datetime, default: Time.current.change(hour: 0, min: 0, sec: 0)
    add_column :attendances, :overtime_application, :string
    add_column :attendances, :overtime_note, :string
  end
end
