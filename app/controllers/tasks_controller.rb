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
    task = Task.find(params[:task])
    task.completed = !task.completed
    user = User.find(params[:user])
    task.user_complete = user.name
    task.complete_time = DateTime.now.in_time_zone('Pacific Time (US & Canada)')
    task.save!
    redirect_to tasks_path
  end

  def new; end

  def create
    redirect_to tasks_path
  end
end
