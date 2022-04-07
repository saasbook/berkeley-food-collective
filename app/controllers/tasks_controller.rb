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
    task.complete_time = DateTime.now
    task.save!
    redirect_to tasks_path
  end

  def new; end

  def create
    new_task = Task.new
    new_task.name = params[:task_name]
    new_task.description = params[:task_description]
    new_task.category = params[:task_category]
    new_task.priority = params[:priority]
    new_task.added = DateTime.now
    new_task.user_add = current_user.name
    new_task.completed = false
    new_task.save!
    redirect_to tasks_path
  end

  def convert_priority(priority)
    if priority.nil?
      return 0
    end
    ret_str = ''
    (1..priority).each do |_|
      ret_str += '!'
    end
    ret_str
  end

  def priority_color(priority)
    if priority.nil?
      'text-primary'
    elsif priority == 1
      'text-success'
    elsif priority == 2
      'text-warning'
    else
      'text-danger'
    end
  end
end
