class ConvertToInventoriesAndItemSlots < ActiveRecord::Migration[5.2]
  def up
    create_table :inventories do |t|
      t.string :name
      t.references :owner, polymorphic: true, index: true
      
      t.datetime :discarded_at, index: true
      t.timestamps
    end

    create_table :item_slots do |t|
      t.integer :item_id
      t.string :inventory_id
      t.integer :quantity

      t.datetime :discarded_at, index: true
      t.timestamps
    end
  end

  def down
    drop_table :inventories
    drop_table :item_slots
  end
end
