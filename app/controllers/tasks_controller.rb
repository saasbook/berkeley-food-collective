class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
  end

  def clear
    Task.clear_tasks
    redirect_to tasks_path
  end

  def checkmark
    @task = params[:task]
    checkmarker(@task)
    redirect_to tasks_path
  end

  def new; end

  def create
    redirect_to tasks_path
  end
end
