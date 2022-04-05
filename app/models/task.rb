class Task < ApplicationRecord

  attr_accessor :completed

  def self.clear_tasks
    Task.delete_all
  end

  def self.checkmarker
    @task = Task.first
    @task.completed = !@task.completed
  end
end
