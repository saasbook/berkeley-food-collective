class TasksController < ApplicationController
  def index
  end

  def new
  end

  def show
    @tasks = Task.find(:all)
    @users = User.find(:all)
  end

  def create
    redirect_to tasks_path
  end
end
