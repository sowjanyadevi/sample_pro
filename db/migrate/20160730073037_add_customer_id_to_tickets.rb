class AddCustomerIdToTickets < ActiveRecord::Migration[5.0]
  def change
add_reference :tickets, :customer, index: true
end
end
