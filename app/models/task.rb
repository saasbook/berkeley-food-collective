class Task < ApplicationRecord
  def self.clear_tasks
    Task.delete_all
  end

  def self.checkmark(task)
    @task = task
    Task.find(@task).completed = !Task.find(@task).completed
  end
end
