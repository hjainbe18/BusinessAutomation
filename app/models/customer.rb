class Customer < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates_presence_of :name
end
