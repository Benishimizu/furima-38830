class CreateItemCategoryIds < ActiveRecord::Migration[6.0]
  def change
    create_table :item_category_ids do |t|

      t.timestamps
    end
  end
end
