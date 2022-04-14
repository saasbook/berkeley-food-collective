class AnnouncementsController < ApplicationController
  def index
<<<<<<< HEAD
    Announcement.populate_from_airtable
    @announcements = Announcement.all
=======
>>>>>>> dc8d77f71cdabded9bc43a71a0e7845978ba059c
  end

  def create
  end
end
