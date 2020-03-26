class CreatePharmacyItems < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacy_items do |t|
      t.belongs_to :pharmacy, null: false, foreign_key: {on_delete: :cascade}
      t.belongs_to :item, null: false, foreign_key: {on_delete: :cascade}
      t.integer :count, null: false, default: 0
      t.timestamps
      t.index([:pharmacy_id, :item_id], unique: true)
    end
  end
end
