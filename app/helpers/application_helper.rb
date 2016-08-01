module ApplicationHelper

	def admins_only(&block)
block.call if current_customer.try(:admin?)
end
end
