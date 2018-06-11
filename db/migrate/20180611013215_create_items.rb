class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :campaign_id
      t.integer :character_id
      t.string :name
      t.string :description
      t.decimal :value, precision: 9, scale: 2

      t.timestamps
    end
  end
end
