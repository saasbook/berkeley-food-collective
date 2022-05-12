class AddAssigneduserstringToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :assigneduserstring, :string
  end
end
