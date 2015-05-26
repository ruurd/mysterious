require "selenium-webdriver"

Given /The application is running/ do
  @driver = Selenium::WebDriver.for(:phantomjs)
  @driver.navigate.to("http://localhost:3000/")
  visit(root_path)
  expect(page).to have_content 'Welcome'
end

And /Nobody is logged in/ do
  expect(page).to have_content 'User'
end

When /I request the login page/ do
  visit(new_user_session_path)
  expect(page).to have_content 'Log in'
end

And (/^I request to be logged out$/) do
  visit(destroy_user_session_path)
end

And /I enter valid credentials/ do
  within ('#session') do
    fill_in( "User Name", :with => user_name )
    fill_in( "Password", :with => 'xyzzyuiop' )
    click_button( "Log in" )
  end
end

Then /I am logged in/ do
  expect(page).to have_content 'tiscali'
end

Then /I am logged out/ do
  expect(page).to have_content 'User'
end

