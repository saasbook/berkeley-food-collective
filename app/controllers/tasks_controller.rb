class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
  end

  def new
  end

  def show
    @tasks = Task.all
    @users = User.all
  end

  def create
    redirect_to tasks_path
  end
end
