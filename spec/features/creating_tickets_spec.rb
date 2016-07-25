require 'spec_helper'
feature "Creating Tickets" do
before do
FactoryGirl.create(:project, name: "Internet Explorer")
visit '/'
click_link "Internet Explorer"
click_link "New Ticket"
end
scenario "Creating a ticket" do
fill_in "Title", with: "Non-standards compliance"
fill_in "Description", with: "My pages are ugly!"
end
end
