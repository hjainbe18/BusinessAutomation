class AddMaterailQuantityToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :material_quantity, :integer, null: false
  end
end
