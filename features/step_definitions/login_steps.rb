require "selenium-webdriver"

Given /The application is running/ do
  @driver = Selenium::WebDriver.for(:phantomjs)
  @driver.navigate.to("http://localhost:3000/")
  visit root_path

  page.has_text? 'Welcome'
end

And /Nobody is logged in/ do
  page.has_text? 'User'
end

When /I request the login page/ do
  visit(new_user_session_path)
  page.has_text? 'Log in'
end

And (/^I request to be logged out$/) do
  visit(destroy_user_session_path)
end

And /I enter valid credentials/ do
  page.fill_in( "user_email", :with => 'rfpels@gmail.com' )
  page.fill_in( "user_password", :with => 'xyzzyuiop' )
  page.click_button( "Log in" )
end

Then /I am logged in/ do
  page.has_text? 'tiscali'
end

Then /I am logged out/ do
  page.has_text? 'User'
end

