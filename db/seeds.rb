# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = [
  { id: 1, username: 'Whapow', first_name: 'Joshua', password: "Joshua123", email: 'Joshua@overlordshovel.com' },
  { id: 2, username: 'Sydriel', first_name: 'Sydney', password: "Audrael<3", email: 'maelsyd@overlordshovel.com' },
  { id: 3, username: 'Kadus', first_name: 'Kadus', password: "2knowALLis2ctrl-A", email: 'maelel@overlordshovel.com' },
  { id: 4, username: 'Cix', first_name: 'Kolrekii', password: "kolrekash-cix6", email: 'maelkol@overlordshovel.com' },
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
  { id: 2, gm_id: 2, name: 'Liam\'s Saga' },
  { id: 3, gm_id: 3, name: 'As the Seasons Change' },
  { id: 4, gm_id: 4, name: 'Lost Mine' }
]
campaigns.each{|campaign| 
  camp = Campaign.create!(campaign)
  inv = Inventory.create!(owner: camp, name: "#{campaign[:name]}'s Inventory")
  Stack.create(inventory: inv, item_id: 9, quantity: 1)
  (10..15).each do |i|
    Stack.create(inventory: inv, item_id: i, quantity: rand(9)+1)
  end
}

characters = [
  { id: 1, player_id: 2, campaign_id: 2, name: 'Audrael' },
  { id: 2, player_id: 2, campaign_id: 2, name: 'Liam' },
]
characters.each{|character| 
  char = Character.create!(character)
  inv = Inventory.create!(owner: char, name: "#{character[:name]}'s Inventory")
  Stack.create(inventory: inv, item_id: char.id, quantity: 1)
  Stack.create(inventory: inv, item_id: 4, quantity: 1)
  Stack.create(inventory: inv, item_id: 5, quantity: 2)
  Stack.create(inventory: inv, item_id: 6, quantity: 10)
  Stack.create(inventory: inv, item_id: 7, quantity: 5)
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