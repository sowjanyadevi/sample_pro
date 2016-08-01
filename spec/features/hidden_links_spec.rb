require 'spec_helper'
feature "hidden links" do
let(:customer) { FactoryGirl.create(:customer) }
let(:admin) { FactoryGirl.create(:admin_customer) }
let(:project) { FactoryGirl.create(:project) }
context "anonymous customers" do
before do
visit '/'
assert_no_link_for "New Project"
end
end
context "regular customers" do
before do
visit project_path(project)
assert_no_link_for "Edit Project"
end
before do
visit project_path(project)
assert_no_link_for "Delete Project"
end
end
context "admin customers" do
before do
visit project_path(project)
assert_link_for "Edit Project"
end
before do
visit project_path(project)
assert_link_for "Delete Project"
end
end
context "anonymous customers" do
before do
visit project_path(project)
assert_no_link_for "Edit Project"
end
before do
visit project_path(project)
assert_no_link_for "Delete Project"
end
end
end