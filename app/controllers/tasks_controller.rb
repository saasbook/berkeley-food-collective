class TasksController < ApplicationController

  def index
    @filter = params[:category]
    @all_categories = %w[Inventory Register Engineering]
    @tasks = if @filter.blank?
               Task.all
             else
               Task.where(category: @filter)
             end
    incomplete_task = @tasks.where(completed: false).order(priority: :desc, added: :asc)
    completed_tasks = @tasks.where(completed: true).order(:complete_time)
    @tasks = incomplete_task + completed_tasks
    @num_incomplete = incomplete_task.count
    @count = 0
    @completed = false
    @curr_categories = @all_categories
    @users = User.all
  end

  def destroy
    task = Task.find(params[:id])
    Task.delete(task)
    redirect_to tasks_path(category: params[:category])
  end

  def checkmark
    task = Task.find(params[:id])
    task.completed = !task.completed
    user = User.find(params[:user])
    task.user_complete = user.name
    task.complete_time = DateTime.now
    task.save!
    redirect_to tasks_path(category: params[:category])
  end

  def new
  end

  def create
    new_task = Task.new
    new_task.name = params[:task_name]
    new_task.description = params[:task_description]
    new_task.category = params[:task_category]
    new_task.priority = params[:priority]
    new_task.added = Time.current
    new_task.user_add = current_user.name
    new_task.completed = false
    new_task.save!
    if params[:task_category] == params[:category]
      redirect_to tasks_path(category: params[:category])
    else
      redirect_to tasks_path
    end
  end

  def update
    task = Task.find(params[:id])
    task.name = params[:task_name]
    task.description = params[:task_description]
    task.category = params[:task_category]
    task.priority = params[:priority]
    task.added = Time.current
    task.user_add = current_user.name
    task.save!
    if params[:task_category] == params[:category]
      redirect_to tasks_path(category: params[:category])
    else
      redirect_to tasks_path
    end
  end

end
