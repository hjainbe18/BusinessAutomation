class User < ApplicationRecord
  has_secure_password
  enum role: %i[default admin supervisor customer]

  validates :email, presence: true, uniqueness: true
  has_one :customer, required: false
  has_one :supervisor, required: false

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :supervisor
end
