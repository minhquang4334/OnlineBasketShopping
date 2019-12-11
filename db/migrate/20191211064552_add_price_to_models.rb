class AddPriceToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :price, :integer
  end
end
