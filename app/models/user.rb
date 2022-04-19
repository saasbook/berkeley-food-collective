class User < ApplicationRecord
  class User < ApplicationRecord
    def self.populate_from_airtable
      email_column = 'E-mail:'
      name_column = 'Full Name'
      client = Airtable::Client.new(ENV['airtable_api_key'])
      # table = client.table(ENV['airtable_app_key'], 'tbl1SuoIW99KUjDMx')
      table = client.table(ENV['airtable_app_key'], 'tblUm0begj9P1Jz8J')
      records = table.all
      all_curr_user_emails = User.all.pluck(:email)
      inactive_user_emails = User.where(active: false).pluck(:email)
      airtable_emails = records.pluck(email_column)
      # create
      to_create = airtable_emails.difference(all_curr_user_emails)
      to_create.each do |email|
        User.create({ name: records.find_by(email_column => email)[name_column], email: email })
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
end
