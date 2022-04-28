class Task < ApplicationRecord

  def self.populate_from_airtable(user_email)
    @client = Airtable::Client.new(ENV["airtable_api_key"])
    @table = @client.table(ENV["airtable_app_key"], "tblwRWq2x609uUzOv")
    @records = @table.records
    @records.each do |record|
      @shift_assignment_array = record["e_mail:_(from_members)_(from_shift_assignment)"]
      if @shift_assignment_array.length != 0 && @shift_assignment_array.include?(user_email) 
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        @parsed_description = markdown.render(record["Description"])
        Task.find_or_create_by({name: record[:name], description: @parsed_description, category: "Airtable", priority: 2, user_add: "BSFC", completed: false})
      end
    end
  end

  def self.clear_tasks
    Task.delete_all
  end

end
