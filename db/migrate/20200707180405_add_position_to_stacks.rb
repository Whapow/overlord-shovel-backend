class AddPositionToStacks < ActiveRecord::Migration[5.2]
  def up
    add_column :stacks, :position, :integer
  end
  def down
    remove_column :stacks, :position
  end
end
