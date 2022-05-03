class AddDescriptionToAnnouncements < ActiveRecord::Migration[7.0]
  def change
    add_column :announcements, :description, :string
  end
end
