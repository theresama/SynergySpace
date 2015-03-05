class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.Space :space
      t.datetime :startdate
      t.datetime :enddate
      t.text :message
      t.boolean :accepted, default: false

      t.timestamps

      t.references :user, index: true
      t.references :space, index: true

    end

    add_foreign_key :spaces, :users
    add_index :spaces, [:user_id, :space, :created_at]
  end
end
