class AddInterestsToUsers < ActiveRecord::Migration
  	def self.up
      add_column :users, :interests, :string
      add_column :users, :skills, :string
 	end

  def self.down
    remove_column :users, :interests
    remove_column :users, :skills
  end
end
