class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.belongs_to :state, null: false, foreign_key: {on_delete: :cascade}
      t.string  :name, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
