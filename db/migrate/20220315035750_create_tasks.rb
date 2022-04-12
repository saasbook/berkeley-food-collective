class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :priority
      t.datetime :added
      t.string :user_add
      t.datetime :complete_time
      t.string :user_complete
      t.boolean :completed

      t.timestamps
    end
  end
end
