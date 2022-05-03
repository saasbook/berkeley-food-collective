class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :airtable_base_id
      t.string :users_table_id
      t.string :tasks_table_id
      t.string :announcements_table_id
      t.string :admin_password_hash

      t.timestamps
    end
  end
end
