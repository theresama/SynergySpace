class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :type
      t.integer :streetnum
      t.string :street
      t.string :city
      t.string :state
      t.string :areacode

      t.timestamps
    end
  end
end
