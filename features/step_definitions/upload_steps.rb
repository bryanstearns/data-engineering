
When(/^I visit the new-upload page$/) do
  visit new_upload_path
end

Then(/^I should see a form for uploading$/) do
  form = page.find("form[action='#{uploads_path}']")
  form.should have_content "Choose a file to upload"
end
