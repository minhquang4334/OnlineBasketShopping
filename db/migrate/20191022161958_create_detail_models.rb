class CreateDetailModels < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_models do |t|
      t.string :price
      t.integer :quantity
      t.references :size, foreign_key: true
      t.references :color, foreign_key: true
      t.references :model, foreign_key: true

      t.timestamps
    end
  end
end
