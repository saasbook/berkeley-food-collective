class Task < ApplicationRecord

  def self.populate_from_airtable(user_email)
    client = Airtable::Client.new(ENV['airtable_api_key'])
    table = client.table(Setting.last.airtable_base_id, Setting.last.tasks_table_id)
    records = table.all
    #Task.where(priority: 2).delete_all unless Task.last.added.today?
    records.each do |record|
      shift_assignment_array = record['e_mail:_(from_members)_(from_shift_assignment)']
      concated_email_string = ''
      unless shift_assignment_array.empty?
        shift_assignment_array.each do |user|
          concated_email_string += user
        end
      end
      if shift_assignment_array.length != 0 && shift_assignment_array.include?(user_email) 
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        parsed_description = markdown.render(record['Description:'])
        unless Task.exists?(name: record[:name])
          Task.create({ name: record[:name], description: parsed_description, category: 'Airtable',
                        priority: 2, user_add: 'BSFC', completed: false, assigneduserstring: concated_email_string })
        end
      end
    end
  end

  def self.clear_tasks
    Task.delete_all
  end

end
