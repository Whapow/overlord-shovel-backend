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
    
    Character.all.each do |character|
      character.build_inventory.save
    end
    Campaign.all.each do |campaign|
      campaign.inventories.build.save
    end

    Item.all.group_by(&:character_id).each do |character_id, items|
      character = Character.find(character_id) if character_id
      campaign = Campaign.find(items.first.campaign_id)

      destination_inventory = (character.present? ? character.inventory : campaign.inventories.first)

      core_items = {}
      items.each do |item|
        item_slots = destination_inventory.item_slots
        core_items[item.name] ||= item
        existing_item_in_slot = item_slots.map{|item_slot| item_slot.item if item_slot.item && item_slot.item.name == item.name}.compact.first
        if existing_item_in_slot
          item_slots.find_by(item: existing_item_in_slot).increment!(:quantity)
        else
          destination_inventory.item_slots.create(item: core_items[item.name], quantity: 1)
        end
        item.discard unless item == core_items[item.name]
      end
    end

  end

  def down
    drop_table :inventories
    drop_table :item_slots

    Item.discarded.each{|item| item.undiscard }
  end
end
