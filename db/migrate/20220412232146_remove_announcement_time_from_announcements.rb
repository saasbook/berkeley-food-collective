class RemoveAnnouncementTimeFromAnnouncements < ActiveRecord::Migration[7.0]
  def change
    remove_column :announcements, :announcementtime, :time
  end
end
