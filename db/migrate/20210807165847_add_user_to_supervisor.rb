class AddUserToSupervisor < ActiveRecord::Migration[6.1]
  def change
    add_reference :supervisors, :user, null: false, foreign_key: true
  end
end
