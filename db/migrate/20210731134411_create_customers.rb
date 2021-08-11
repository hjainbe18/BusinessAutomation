class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers, uuid: true do |t|
      t.string :name
      t.text :address
      t.bigint :contact_number

      t.timestamps
    end
  end
end
