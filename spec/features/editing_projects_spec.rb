require 'spec_helper'
feature "Editing Projects" do
before do
FactoryGirl.create(:project, name: "TextMate 2")
visit "/"
click_link "TextMate 2"
click_link "Edit Project"
fill_in "Name", with: "TextMate 2 beta"
end
end
