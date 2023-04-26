class CreateItemDescriptionIds < ActiveRecord::Migration[6.0]
  def change
    create_table :item_description_ids do |t|

      t.timestamps
    end
  end
end
