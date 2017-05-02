class AddAttachmentAttachmentToFloods < ActiveRecord::Migration
  def self.up
    change_table :floods do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :floods, :attachment
  end
end
