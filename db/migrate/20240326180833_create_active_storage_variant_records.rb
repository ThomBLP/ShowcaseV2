class CreateActiveStorageVariantRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :active_storage_variant_records do |t|
      t.references :blob, null: false, foreign_key: true
      t.string :variation_digest

      t.timestamps
    end
  end
end
