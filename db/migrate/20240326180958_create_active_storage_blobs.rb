class CreateActiveStorageBlobs < ActiveRecord::Migration[7.1]
  def change
    create_table :active_storage_blobs do |t|
      t.string :key
      t.string :filename
      t.string :content_type
      t.text :metadata
      t.string :service_name
      t.integer :byte_size
      t.string :checksum

      t.timestamps
    end
  end
end
