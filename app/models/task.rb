class Task < ApplicationRecord


  def self.clear_tasks
    Task.delete_all
  end

end
