class CreateActiveStorageAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :active_storage_attachments do |t|
      t.string :name
      t.string :record_type
      t.integer :record_id
      t.integer :blob_id

      t.timestamps
    end
  end
end
