class AddPrice < ActiveRecord::Migration
  def change
    add_column :spaces, :description, :string
    add_column :spaces, :price, :decimal, :precision => 8, :scale => 2
  end
end
