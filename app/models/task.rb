class Task < ApplicationRecord

  attr_accessor :completed

  def self.clear_tasks
    Task.delete_all
  end

  def checkmarks
    @task = Task.find(13)
    @task.completed = !@task.completed
  end
end
