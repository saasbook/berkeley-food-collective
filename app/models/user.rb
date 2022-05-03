class User < ApplicationRecord
  def self.populate_from_airtable
    email_column = 'E-mail:'
    name_column = 'Full Name'

    settings = Setting.last
    client = Airtable::Client.new(ENV['airtable_api_key'])
    table = client.table(settings.airtable_base_id, settings.user_table_id)
    records = table.all
    all_curr_user_emails = User.all.pluck(:email)
    inactive_user_emails = User.where(active: false).pluck(:email)
    airtable_emails = records.pluck(email_column)
    # create
    to_create = airtable_emails.difference(all_curr_user_emails)
    to_create.each do |email|
      User.create({ name: records.find(email_column => email).first[name_column], email: email })
    end
    # deactivate
    to_deactivate = all_curr_user_emails.difference(airtable_emails)
    to_deactivate.each do |email|
      user = User.find_by(email: email)
      user.active = false
      user.save!
    end
    # reactivate
    to_reactivate = inactive_user_emails.intersection(airtable_emails)
    to_reactivate.each do |email|
      user = User.find_by(email: email)
      user.active = true
      user.save!
    end
  end
end
