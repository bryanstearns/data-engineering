
When(/^I visit the new-upload page$/) do
  visit new_upload_path
end

Then(/^I should see a form for uploading$/) do
  form = page.find("form[action='#{uploads_path}']")
  form.should have_content 'Choose a file to upload'
end

When(/^I upload a datafile$/) do
  step 'I visit the new-upload page'
  page.attach_file('datafile', 'example_input.tab')
  page.click_on('Upload')
end

Then(/^I should see the total gross revenue$/) do
  flash = page.find("#flash_notice")
  flash.should have_content 'total gross revenue is $1,000.00'
end
