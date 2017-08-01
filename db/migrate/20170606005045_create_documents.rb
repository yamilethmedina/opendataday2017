class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :flood, index: true
      t.string :upload_file_name
      t.string :upload_content_type
      t.integer :upload_file_size

      t.timestamps null: false
    end
  end
end
