class AddColumnsToUsers2 < ActiveRecord::Migration[5.2]
  def change
    add_reference :user, :category, foreign_key:true
  end
end
