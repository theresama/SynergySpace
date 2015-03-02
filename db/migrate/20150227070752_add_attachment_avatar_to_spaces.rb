class AddAttachmentAvatarToSpaces < ActiveRecord::Migration
  def self.up
    change_table :spaces do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :spaces, :avatar
  end
end
