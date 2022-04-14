class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def create
  end
end
