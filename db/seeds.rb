# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = [
  { id: 1, username: 'Joshua', first_name: 'Joshua', password: "Joshua123", email: 'Joshua@overlord-shovel.com' },
  { id: 2, username: 'Jessica', first_name: 'Jessica', password: "Jessica123", email: 'Jessica@overlord-shovel.com' },
  { id: 3, username: 'Evan', first_name: 'Evan', password: "Evan123", email: 'Evan@overlord-shovel.com' },
  { id: 4, username: 'Weston', first_name: 'Weston', password: "Weston123", email: 'Weston@overlord-shovel.com' }
]
users.each{|user| User.create!(user)}

items = [
  { id: 1, name: 'Diocles', description: 'Adamantine Gladius', value: 50000 },
  { id: 2, name: 'Lucille', description: 'Coilgun', value: 50000 },
  { id: 3, name: 'Revolver', description: 'Distance Enchant', value: 50000 },
  { id: 4, name: 'Bedroll', description: 'Old-Timey Sleeping Bag', value: 5 },
  { id: 5, name: 'Rope', description: 'An Adventurer\'s Best Friend', value: 5 },
  { id: 6, name: 'Trail Rations', description: 'Now With 30% Less Broken Teeth', value: 5 },
  { id: 7, name: 'Torch', description: 'Light Up My Life', value: 5 },
  { id: 8, name: 'Battery', description: 'Sultan Brand', value: 100 },
  { id: 9, name: 'Shiny Thing', description: 'Precious Treasure', value: 99999 },
  { id: 10, name: 'Useful Thing', description: 'Everyone Needs One', value: 15 },
  { id: 11, name: 'Boring Thing', description: 'It Serves A Purpose', value: 10 },
  { id: 12, name: 'Broken Thing', description: 'May Be Worth Repairing', value: 1 },
  { id: 13, name: 'Random Thing', description: 'Probably Junk', value: 0 },
  { id: 14, name: 'Neat Thing', description: 'I Could Talk About This For Hours', value: 1500 },
  { id: 15, name: 'Bland Thing', description: 'Not Much Can Be Said About This', value: 25 },
]
items.each{|item| Item.create!(item)}

campaigns = [
  { id: 1, gm_id: 1, name: 'Cy\'s Saga' },
  { id: 2, gm_id: 1, name: 'As The Seasons Change' },
  { id: 3, gm_id: 4, name: 'Farrenmore' },
  { id: 4, gm_id: 3, name: 'Sille' }
]
campaigns.each{|campaign| 
  camp = Campaign.create!(campaign)
  inv = Inventory.create!(owner: camp, name: "#{campaign[:name]}'s Inventory")
  ItemSlot.create(inventory: inv, item_id: 9, quantity: 1)
  (10..15).each do |i|
    ItemSlot.create(inventory: inv, item_id: i, quantity: rand(9)+1)
  end
}

characters = [
  { id: 1, player_id: 1, campaign_id: 3, name: 'Audrael' },
  { id: 2, player_id: 2, campaign_id: 3, name: 'Mouse' },
  { id: 3, player_id: 3, campaign_id: 3, name: 'Sticky' }
]
characters.each{|character| 
  char = Character.create!(character)
  inv = Inventory.create!(owner: char, name: "#{character[:name]}'s Inventory")
  ItemSlot.create(inventory: inv, item_id: char.id, quantity: 1)
  ItemSlot.create(inventory: inv, item_id: 4, quantity: 1)
  ItemSlot.create(inventory: inv, item_id: 5, quantity: 2)
  ItemSlot.create(inventory: inv, item_id: 6, quantity: 10)
  ItemSlot.create(inventory: inv, item_id: 7, quantity: 5)
}

journals = [
  { id: 1, name: 'Journal 01', campaign_id: 3 },
  { id: 2, name: 'Journal 02', campaign_id: 3 },
  { id: 3, name: 'Journal 03', campaign_id: 1 },
  { id: 4, name: 'Journal 04', campaign_id: 2 }
]
journals.each{|journal| Journal.create!(journal)}

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end