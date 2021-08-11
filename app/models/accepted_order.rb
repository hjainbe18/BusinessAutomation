class AcceptedOrder < ApplicationRecord
  belongs_to :supervisor
  belongs_to :order
end
