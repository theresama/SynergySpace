class AddUserIdToLease < ActiveRecord::Migration
  def change
  	add_column :leases, :user_id, :integer
  end
end
