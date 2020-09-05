class ConvertStackInventoryIdToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :stacks, :inventory_id, 'integer USING CAST(inventory_id AS integer)'
    add_index :stacks, :inventory_id
  end
end
