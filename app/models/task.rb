class Task < ApplicationRecord

  attr_accessor :completed

  def self.clear_tasks
    Task.delete_all
  end

end
