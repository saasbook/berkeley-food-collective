class AddCategoriesToSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :categories, :string
  end
end
