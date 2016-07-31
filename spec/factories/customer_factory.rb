# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
factory :customer do
name "username"
email "sample@example.com"
password "hunter2"
password_confirmation "hunter2"
factory :admin_customer do
admin true
end
end
end