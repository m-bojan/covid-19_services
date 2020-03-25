class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.belongs_to :city, null: false, foreign_key: {on_delete: :cascade}
      t.string :name, null: false
      t.timestamps
    end
  end
end
