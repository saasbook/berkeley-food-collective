class Task < ApplicationRecord

  attr_accessor :completed

  def self.clear_tasks
    Task.delete_all
  end

  def checkmarks(task)
    @task = Task.find(task)
    @task.completed = !@task.completed
  end
end
