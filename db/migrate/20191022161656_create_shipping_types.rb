class CreateShippingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_types do |t|
      t.string :shipping_type

      t.timestamps
    end
  end
end
