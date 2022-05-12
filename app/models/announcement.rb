# frozen_string_literal: true

require 'active_support/all'

class Announcement < ApplicationRecord
  def self.populate_from_airtable
    client = Airtable::Client.new(ENV['airtable_api_key'])
    table = client.table(Setting.last.airtable_base_id, Setting.last.announcements_table_id)
    begin 
      records = table.records
    rescue TypeError
      raise Exception.new("Check Airtable Config!")
    end
    Announcement.delete_all
    records.each do |record|
      recorded_author = if record[:submitteremail].length.zero?
                           'BSFC'
                         else
                           record[:submitteremail][0]
                         end
      begin 
        Announcement.create({ message: record[:event_name], eventtime: record[:event_time],audience: recorded_author,
                              location: record[:event_location] })
      rescue StandardError
        Exception.new('Airtable announcement creation failed.  Please check Airtable inputs or retry later')
      end
    end
  end
end
