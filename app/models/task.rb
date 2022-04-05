class Task < ApplicationRecord
  def self.clear_tasks
    Task.delete_all
  end

  def self.checkmarker
    @task = Task.first
    @task.completed = true
  end
end
