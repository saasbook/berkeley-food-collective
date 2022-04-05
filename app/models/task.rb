class Task < ApplicationRecord
  def self.clear_tasks
    Task.delete_all
  end

  def self.checkmark
    @task = Task.find(14)
    @task.completed = !@task.completed
  end
end
