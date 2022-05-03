class User < ApplicationRecord
    def self.populate_from_airtable
        @@client = Airtable::Client.new(ENV["airtable_api_key"])
        @@table = @@client.table(ENV["airtable_app_key"], "tbl1SuoIW99KUjDMx")
        @@records = @@table.records
        @@records.each do |record|
            User.find_or_create_by({name: record["Full Name"], email: record["E-mail:"]})
        end
      end
end
