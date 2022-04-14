class AnnouncementsController < ApplicationController
  def index
    Announcement.populate_from_airtable
    @announcements = Announcement.order("eventtime DESC")
    @count = 0
  end

  def create
  end
end
