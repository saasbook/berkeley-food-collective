class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.populate_from_airtable
  end

  def create
  end
end
