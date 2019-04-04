class RenameItemSlotsToStacks < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :item_slots, :stacks
  end

  def self.down
    rename_table :stacks, :item_slots
  end
end
