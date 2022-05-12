class TasksController < ApplicationController

  def index
    Task.populate_from_airtable(current_user.email)
    @filter = params[:category]
    @all_categories = Setting.last.categories.split(/\s*,\s*/)
    user_airtable_tasks = Task.where('assigneduserstring LIKE ?', '%' + current_user.email + '%')
    user_tasks = user_airtable_tasks.or(Task.where(priority: [1, 3]))
    @tasks = if @filter.blank?
               user_tasks
             else
               user_tasks.where(category: @filter).all
             end
    incomplete_task = @tasks.where(completed: false).order(priority: :desc, added: :asc)
    @num_high = incomplete_task.where(priority: 3).count
    @num_med = incomplete_task.where(priority: 2).count
    @num_low = incomplete_task.where(priority: 1).count
    completed_tasks = @tasks.where(completed: true).order(:complete_time).reverse
    @tasks = incomplete_task + completed_tasks
    @num_incomplete = incomplete_task.count
    @count = @sub_count = 0
    @completed = false
    @curr_categories = @all_categories
    @users = User.all
  end

  def destroy
    begin
      task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to tasks_path
      flash[:danger] = 'Task no longer exists.'
    else
      Task.delete(task)
      redirect_to tasks_path(category: params[:category])
    end
  end

  def checkmark
    begin
      task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to tasks_path
      flash[:danger] = 'Task no longer exists.'
    else
      user = User.find(params[:user])
      if params[:check_type] == 'checking' && task.completed
        redirect_to tasks_path
        flash[:danger] = "This task has already been completed by #{task.user_complete}."
      elsif params[:check_type] == 'unchecking' && !task.completed
        redirect_to tasks_path
        flash[:danger] = "This task has already been marked as incomplete by #{task.user_complete}."
      else
        task.completed = !task.completed
        task.user_complete = user.name
        task.complete_time = Time.current
        task.save!
        redirect_to tasks_path(category: params[:category])
      end
    end
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
