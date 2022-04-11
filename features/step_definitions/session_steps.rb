When(/I start on the login page/) do
  visit root_path
end

When (/I visit the tasks page/) do
  visit path_to("tasks")
end

When (/I visit the announcements page/) do
  visit path_to("announcements")
end

When (/I login with "([^"]*)"$/) do |email|
  fill_in("session_email", :with => email)
  click_button("Login")
end