class AddAttachmentUpload1Upload2Upload3ToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :upload1
      t.attachment :upload2
      t.attachment :upload3
    end
  end

  def self.down
    remove_attachment :documents, :upload1
    remove_attachment :documents, :upload2
    remove_attachment :documents, :upload3
  end
end
