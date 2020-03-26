class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name, null: false, index: { unique: true }
      t.integer :item_type, null: false
      t.text :description
      t.timestamps
    end
  end
end
