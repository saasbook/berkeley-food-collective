class AnnouncementsController < ApplicationController
  def index
    Announcement.populate_from_airtable
  end

  def create
  end
end
