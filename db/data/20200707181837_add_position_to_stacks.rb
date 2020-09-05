class AddPositionToStacks < ActiveRecord::Migration[5.2]
  def up
    Inventory.all.each do |inv|
      position = 1
      inv.stacks.each do |stack|
        position += 1 if stack.update(position: position)
      end
    end
  end

  def down
    Stack.update_all(position: nil)
  end
end
