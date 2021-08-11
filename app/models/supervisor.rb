class Supervisor < ApplicationRecord
  has_many :accepted_orders
  has_many :orders, through: :accepted_orders

  belongs_to :user
end
