class Task < ApplicationRecord

  def self.populate_from_airtable(user_email)
    @client = Airtable::Client.new(ENV["airtable_api_key"])
    @table = @client.table(ENV["airtable_app_key"], "tblwRWq2x609uUzOv")
    @records = @table.records
    @records.each do |record|
      @shift_assignment_array = record["e_mail:_(from_members)_(from_shift_assignment)"]
      if @shift_assignment_array.length != 0 && @shift_assignment_array.include?(user_email) && !User.all.pluck(:name).include?(record[:name])
        Task.create({name: record[:name], description: record["description:"], category: "Airtable", priority: 2, added: Time.current, user_add: "BSFC", completed: false})
      end
    end
  end

  def self.clear_tasks
    Task.delete_all
  end

end
