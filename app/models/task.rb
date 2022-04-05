class Task < ApplicationRecord
  def self.clear_tasks
    Task.delete_all
  end

  def checkmark(task)
    task.completed = !task.completed
  end
end
