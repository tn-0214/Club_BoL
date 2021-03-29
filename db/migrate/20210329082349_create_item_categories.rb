class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.references :item,                    foreign_key: true, type: :integer
      t.references :category,                foreign_key: true
      t.timestamps
    end
  end
end
