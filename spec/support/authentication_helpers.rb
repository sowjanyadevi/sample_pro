module AuthenticationHelpers
def sign_in_as!(customer)
visit '/signin'
fill_in "Name", with: customer.name
fill_in "Password", with: customer.password
end
end
RSpec.configure do |c|
c.include AuthenticationHelpers, type: :feature
end
