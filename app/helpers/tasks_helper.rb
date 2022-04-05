module TasksHelper
  def tasks
    @tasks = Task.find(:all)
  end
end
