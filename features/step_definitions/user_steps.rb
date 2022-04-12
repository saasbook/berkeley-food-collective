Given(/the following users in the database/) do |user_table|
  user_table.hashes.each do |usr|
      User.create(usr)
      # each returned element will be a hash whose key is the table header.
      # you should arrange to add that movie to the database here.
  end
end