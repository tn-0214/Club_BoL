class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
      add_column :items, :minimum_period, :integer
  end
end
