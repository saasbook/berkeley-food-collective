require 'active_support/all'

class Announcement < ApplicationRecord
    def self.populate_from_airtable
        @client = Airtable::Client.new(ENV["airtable_api_key"])
        @table = @client.table(ENV["airtable_app_key"], "tblI0sVfVCRN7Wwla")
        @records = @table.records
        Announcement.delete_all
        @records.each do |record|
            Announcement.create({message: record[:event_name], eventtime: record[:event_time], audience: record[:submitteremail], location: record[:event_location]})
        end 
    end
end
