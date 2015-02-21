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

      t.references :user, index: true

    end

    add_foreign_key :spaces, :users
    add_index :spaces, [:user_id, :created_at]
  end
end
