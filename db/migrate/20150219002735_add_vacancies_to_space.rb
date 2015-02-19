class AddVacanciesToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :vacancies, :integer
  end
end
