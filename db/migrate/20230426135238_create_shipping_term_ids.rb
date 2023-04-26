class CreateShippingTermIds < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_term_ids do |t|

      t.timestamps
    end
  end
end
