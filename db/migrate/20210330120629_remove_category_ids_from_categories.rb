class RemoveCategoryIdsFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :category_ids, :integer
  end
end
