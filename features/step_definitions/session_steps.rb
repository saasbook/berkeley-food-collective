When(/I start on the login page/) do
  visit root_path
end

When /^(?:|I )click on the menu tab/ do
  page.find('button', id: "hamburger-menu").click()
end