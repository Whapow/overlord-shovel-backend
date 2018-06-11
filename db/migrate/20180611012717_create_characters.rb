class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :player_id
      t.integer :campaign_id
      t.string :name

      t.timestamps
    end
  end
end
