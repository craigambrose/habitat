Then /^I should be on the new project page$/ do
  current_path.should == new_project_path
end

When /^I submit valid new project details$/ do
  stub_request(:any, /maps\.googleapis\.com/).to_return(:status => 200, :body => FakeGeocoding.new_york, :headers => {})  
  fill_in "Name", :with => "Backyard"
  select "Suburban Yard", :from => "Category"
  fill_in "Address", :with => "New York, New York"
  fill_in "Site area", :with => "2"
  select "acres", :form => "#project_site_area_unit"
  click_button "Create Project"
end

Then /^I should be on my project page$/ do
  current_path.should =~ /projects\/\d+/
end

Given /^I am on the "([^"]*)" project step$/ do |step_name|
  within('#project_steps') do
    click_link step_name
  end
end

