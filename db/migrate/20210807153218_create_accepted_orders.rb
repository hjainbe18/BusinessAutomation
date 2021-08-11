class CreateAcceptedOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :accepted_orders do |t|
      t.bigint :order_id
      t.integer :current_status, default: 0
      t.datetime :deadline

      t.timestamps
    end
  end
end
