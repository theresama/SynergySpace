class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.integer :user
      t.integer :space
      t.datetime :startdate
      t.datetime :enddate
      t.text :message
      t.boolean :accepted

      t.timestamps
    end
  end
end
