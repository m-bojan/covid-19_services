class CreatePharmacies < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacies do |t|
      t.belongs_to :region, null: false, foreign_key: { on_delete: :cascade }
      t.string  :name, null: false
      t.string  :location
      t.decimal :longitude, null: false, precision: 10, scale: 8, default: 0.0
      t.decimal :latitude,  null: false, precision: 10, scale: 8, default: 0.0
      t.timestamps
      t.index([:region_id, :name], unique: true)
    end
  end
end

