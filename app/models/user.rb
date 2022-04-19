class User < ApplicationRecord
  def self.populate_from_airtable
    @@client = Airtable::Client.new(ENV['airtable_api_key'])
    @@table = @@client.table(ENV['airtable_app_key'], "tbl1SuoIW99KUjDMx")
    @@records = @@table.all
    User.delete_all #could be replaced by if checks to prevent duplicate Users
    @@records.each do |record|
      User.create({name: record["Full Name"], email: record["E-mail:"]})
    end
  end
end
