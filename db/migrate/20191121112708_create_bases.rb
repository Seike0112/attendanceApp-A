class CreateBases < ActiveRecord::Migration[5.1]
  def change
    create_table :bases do |t|
      t.integer :base_id
      t.string :base_name
      t.string :attendance_typ

      t.timestamps
    end
  end
end
