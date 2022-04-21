class AddLocationToAnnouncements < ActiveRecord::Migration[7.0]
  def change
    add_column :announcements, :location, :string
  end
end
