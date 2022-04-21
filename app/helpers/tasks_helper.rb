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
      image_tag 'airtable_logo.png', { alt: 'Airtable Logo', width: 15, height: 15 }
    else
      '!' * priority
    end
  end
end
