class AddAdminRefToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :admin, foreign_key: true, :null => true
  end
end
