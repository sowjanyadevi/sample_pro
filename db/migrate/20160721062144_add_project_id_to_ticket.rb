class AddProjectIdToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :project_id, :integer
  end
end
