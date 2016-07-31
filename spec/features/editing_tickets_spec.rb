require 'spec_helper'
feature "Editing tickets" do
let!(:project) { FactoryGirl.create(:project) }
let!(:ticket) { FactoryGirl.create(:ticket, project: project) }
let!(:ticket) do
ticket = FactoryGirl.create(:ticket, project: project)
ticket.update(customer: customer)
ticket
end
before do
sign_in_as!(customer)
visit '/'
click_link project.name
click_link ticket.title
click_link "Edit Ticket"

within("#ticket h2") do
expect(page).to have_content("Make it really shiny!")
end
expect(page).to_not have_content ticket.title
end
end
