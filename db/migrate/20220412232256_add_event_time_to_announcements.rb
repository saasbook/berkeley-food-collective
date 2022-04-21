class AddEventTimeToAnnouncements < ActiveRecord::Migration[7.0]
  def change
    add_column :announcements, :eventtime, :datetime
  end
end
