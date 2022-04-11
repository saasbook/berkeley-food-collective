class AddDefaultValueActiveUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :active, true
  end
end
