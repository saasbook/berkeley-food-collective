class User < ApplicationRecord
    def self.populate_from_airtable
        @@client = Airtable::Client.new(ENV["airtable_api_key"])
        @@table = @@client.table(Setting.last.airtable_base_id, Setting.last.users_table_id)
        @@records = @@table.records
        @@records.each do |record|
            User.find_or_create_by({name: record["Full Name"], email: record["E-mail:"]})
        end
      end
end
