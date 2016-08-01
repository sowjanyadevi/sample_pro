require 'spec_helper'
feature "Creating Tickets" do
before do
project = FactoryGirl.create(:project)
customer = FactoryGirl.create(:customer)
@email = customer.email
visit '/'
click_link project.name
click_link "New Ticket"
message = "You need to sign in or sign up before continuing."
expect(page).to have_content(message)
fill_in "Name", with: customer.name
fill_in "Password", with: customer.password
click_button "Sign in"
click_link project.name
click_link "New Ticket"
within "#ticket #author" do
expect(page).to have_content("Created by #{@email}")
end
end
end