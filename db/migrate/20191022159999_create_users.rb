class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.string :address
      t.string :picture
      t.string :phone
      t.boolean :gender
      t.date :birthday
      t. string :password_digest

      t.timestamps
    end
  end
end
