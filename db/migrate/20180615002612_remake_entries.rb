class RemakeEntries < ActiveRecord::Migration[5.2]
  def change
    drop_table :entries
    create_table :entries do |t|
      t.belongs_to :character, null: true, index: true
      t.belongs_to :journal, null: true, index: true
      t.decimal :reward, precision: 9, scale: 2
      t.integer :experience
    end
  end
end
