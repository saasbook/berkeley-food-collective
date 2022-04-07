module TasksHelper
  def priority_color(priority)
    case priority
    when 1
      'text-success'
    when 2
      'text-warning'
    when 3
      'text-danger'
    else
      'text-primary'
    end
  end

  def priority_visualizer(priority)
    '!' * priority
  end
end
