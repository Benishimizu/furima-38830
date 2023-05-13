class CreateSenders < ActiveRecord::Migration[6.0]
  def change
    create_table :senders do |t|
      t.string          :postal_code, null:false 
      t.integer         :prefecture_id, null: false
      t.string          :city, null:false
      t.string          :detailed_address, null:false
      t.string          :building
      t.string          :tel, null:false
      t.references      :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
