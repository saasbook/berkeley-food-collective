# frozen_string_literal: true

require 'active_support/all'

class Announcement < ApplicationRecord
  def self.populate_from_airtable
    @client = Airtable::Client.new(ENV['airtable_api_key'])
    @announcements_table_id = Setting.last.announcements_table_id
    @table = @client.table(ENV['airtable_app_key'], @announcements_table_id)
    @records = @table.records
    Announcement.delete_all
    @records.each do |record|
      @recorded_author = if record[:submitteremail].length.zero?
                           'BSFC'
                         else
                           record[:submitteremail][0]
                         end
      Announcement.create({ message: record[:event_name], eventtime: record[:event_time],audience: @recorded_author,
                            location: record[:event_location] })
    end
  end
end
