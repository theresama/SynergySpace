class ChangeSpaceDescriptionTypeToText < ActiveRecord::Migration
  def change
  	change_column :spaces, :description,  :text
  	add_column :spaces, :start_date, :datetime
  	add_column :spaces, :end_date, :datetime
  end
end
