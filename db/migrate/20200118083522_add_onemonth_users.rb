class AddOnemonthUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :app_name, :string
  end
end
