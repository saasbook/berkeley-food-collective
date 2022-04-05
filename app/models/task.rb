class Task < ApplicationRecord
  def self.clear_tasks
    Task.delete_all
  end

  def self.checkmark(task)
    @task = Task.find(task)
    @task.completed = !@task.completed
  end
end
