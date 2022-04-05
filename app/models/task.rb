class Task < ApplicationRecord
  def clear_tasks
    Task.delete_all
  end
end
