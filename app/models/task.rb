class Task < ApplicationRecord

  def self.populate_from_airtable
    @client = Airtable::Client.new(ENV["airtable_api_key"])
    @table = @client.table(ENV["airtable_app_key"], "tblwRWq2x609uUzOv")
    @records = @table.records
    Task.where(priority: 2).delete_all
    @records.each do |record|
      Task.create({name: record[:name], description: record["description:"], category: "Airtable", priority: 2, added: Time.current, user_add: "BSFC", completed: false})
    end
  end

  def self.clear_tasks
    Task.delete_all
  end

end
