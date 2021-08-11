class Order < ApplicationRecord
  enum raw_material: %i[cotton yarn cloth]
  enum process_type: %i[full customized]
  belongs_to :customer

  has_one :accepted_order
  has_one :supervisor,  through: :accepted_order

  validates_presence_of :material_quantity
end
