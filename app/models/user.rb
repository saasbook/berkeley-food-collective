class User < ApplicationRecord
  def self.populate_from_airtable
    ENV["airtable_key"] = "keyreuExTdz41S45K" #temporary, will be replaced by figaro + config/application.yml
    @@client = Airtable::Client.new(ENV["airtable_key"])
    @@table = @@client.table("appBVUbGPToiaKXQK", "tblUm0begj9P1Jz8J")
    @@records = @@table.records
    User.delete_all #could be replaced by if checks to prevent duplicate Users
    @@records.each do |record|
      User.create({name: record[:name], email: record[:email]})
    end
  end

end
