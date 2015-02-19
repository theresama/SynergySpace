class ChangeColumnName < ActiveRecord::Migration
	def change
		rename_column :spaces, :type, :spacetype
	end
end