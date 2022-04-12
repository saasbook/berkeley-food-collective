class Announcement < ApplicationRecord
    def self.populate_from_airtable
        @client = Airtable::Client.new("keyuszZsBlgcxdMAy")
        @table = @client.table("keyuszZsBlgcxdMAy", "Test")
        @records = @table.records
        byebug 
end
