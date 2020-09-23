class AddClinicOwnerToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :clinic_owner, :boolean
  end
end
