class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :lending_period,  null: false
      t.references :user,         foreign_key: true,type: :integer
      t.references :item,         foreign_key: true,type: :integer
      t.timestamps
    end
  end
end
