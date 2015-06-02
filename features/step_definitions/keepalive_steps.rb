require "selenium-webdriver"

When(/^I check keepalive$/) do
  visit '/keepalive'
end

Then(/^The application tells me it runs$/) do
  page.text.include? 'OK'
end