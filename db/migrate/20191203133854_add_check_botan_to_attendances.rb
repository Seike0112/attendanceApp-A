class AddCheckBotanToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :check_botan, :boolean
  end
end
