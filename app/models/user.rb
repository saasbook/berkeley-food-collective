class User < ApplicationRecord
  def self.populate_from_airtable
    @@client = Airtable::Client.new(ENV["airtable_key"])
    @@table = @@client.table(ENV["airtable_app_key"], ENV["airtable_table_id"])
    @@records = @@table.records
    User.delete_all #could be replaced by if checks to prevent duplicate Users
    @@records.each do |record|
      User.create({name: record[:name], email: record[:email]})
    end
  end

end
