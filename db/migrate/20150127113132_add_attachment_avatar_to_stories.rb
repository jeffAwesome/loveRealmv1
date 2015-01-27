class AddAttachmentAvatarToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :stories, :avatar
  end
end
