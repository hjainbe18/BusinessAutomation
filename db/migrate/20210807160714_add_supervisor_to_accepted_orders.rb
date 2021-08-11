class AddSupervisorToAcceptedOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :accepted_orders, :supervisor_id, :bigint
  end
end
