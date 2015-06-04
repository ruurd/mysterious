And /Nobody is logged in/ do
  page.text.include? 'User'
end

And /I request the login page/ do
  visit new_user_session_path
  page.has_text? 'Log in'
end

And (/^I request to be logged out$/) do
  puts destroy_user_session_path
  page.driver.submit :delete, destroy_user_session_path, {}
end

And /I enter valid credentials/ do
  page.fill_in('user_email', with: 'xyzzy@feature.test' )
  page.fill_in('user_password', with: 'xyzzyuiop' )
  page.click_button('Log in')
end

Then /I am logged in/ do
  page.has_text? 'feature.test'
end

Then /I am logged out/ do
  page.has_text? 'User'
end

