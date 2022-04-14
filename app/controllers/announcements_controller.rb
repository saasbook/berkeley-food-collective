class AnnouncementsController < ApplicationController
  def index
    Announcement.populate_from_airtable
    @announcements = Announcement.all
  end

  def create
  end
end
