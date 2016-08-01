class Customer < ApplicationRecord
	has_secure_password
def to_s
"#{email} (#{admin? ? "Admin" : "Customer"})"
end
validates :email, presence: true
end
