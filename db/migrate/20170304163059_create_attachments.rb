class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :flood, index: true
      t.string :upload_file_name
      t.string :upload_file_type
      t.integer :upload_file_size

      t.timestamps
    end
  end
end
