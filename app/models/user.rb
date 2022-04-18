class User < ApplicationRecord
  def self.populate_from_airtable
    @@client = Airtable::Client.new("keyreuExTdz41S45K")
    @@table = @@client.table("appBVUbGPToiaKXQK", "tblUm0begj9P1Jz8J")
    @@records = @@table.records
    User.delete_all #could be replaced by if checks to prevent duplicate Users
    @@records.each do |record|
      User.create({name: record["Full Name"], email: record["E-mail"]})
    end
  end
end
