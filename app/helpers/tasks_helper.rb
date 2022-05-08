module TasksHelper
  def priority_color(priority)
    case priority
    when 1
      'text-success'
    when 3
      'text-danger'
    else
      ''
    end
  end

  def priority_visualizer(priority)
    if priority == 2
      image_tag 'airtable_logo.png', { alt: 'Airtable Logo', width: 18, height: 18 }
    else
      '!' * priority
    end
  end

  def incomplete_subsection(curr_count, curr_priority)
    subsection_titles = ['Low Priority Tasks', 'Airtable Recurring Tasks', 'High Priority Tasks']
    if curr_count.zero? || (curr_count == @num_high && @num_med.positive?) ||
       (curr_count == @num_high + @num_med && @num_low.positive?)
      @sub_count = 0
      subsection_titles[curr_priority - 1]
    else
      'no sub section'
    end
  end

  def subsection?(curr_count, curr_priority)
    incomplete_subsection(curr_count, curr_priority) != 'no sub section'
  end
end
