class AddDiscardedAtToTables < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :deleted
    add_column :users, :discarded_at, :datetime
    add_index :users, :discarded_at

    add_column :campaigns, :discarded_at, :datetime
    add_index :campaigns, :discarded_at

    add_column :characters, :discarded_at, :datetime
    add_index :characters, :discarded_at

    add_column :items, :discarded_at, :datetime
    add_index :items, :discarded_at

    add_column :journals, :discarded_at, :datetime
    add_index :journals, :discarded_at

    add_column :entries, :discarded_at, :datetime
    add_index :entries, :discarded_at
  end

  def down
    add_column :users, :deleted, :boolean
    remove_column :users, :discarded_at
    remove_column :campaigns, :discarded_at
    remove_column :characters, :discarded_at
    remove_column :items, :discarded_at
    remove_column :journals, :discarded_at
    remove_column :entries, :discarded_at
  end
end
