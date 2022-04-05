class TasksController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def tasks
    @tasks ||= Task.find(:all)
  end

  def create
    redirect_to tasks_path
  end
end
