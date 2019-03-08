# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = [
  { id: 1, username: 'Joshua', password: "Joshua123", email: 'Joshua@overlord-shovel.com' },
  { id: 2, username: 'Jessica', password: "Jessica123", email: 'Jessica@overlord-shovel.com' },
  { id: 3, username: 'Evan', password: "Evan123", email: 'Evan@overlord-shovel.com' },
  { id: 4, username: 'Weston', password: "Weston123", email: 'Weston@overlord-shovel.com' }
]
users.each{|user| User.create!(user)}

campaigns = [
  { id: 1, gm_id: 1, name: 'Cy\'s Saga' },
  { id: 2, gm_id: 1, name: 'As The Seasons Change' },
  { id: 3, gm_id: 4, name: 'Farrenmore' },
  { id: 4, gm_id: 3, name: 'Sille' }
]
campaigns.each{|campaign| Campaign.create!(campaign)}

characters = [
  { id: 1, player_id: 1, campaign_id: 3, name: 'Audrael' },
  { id: 2, player_id: 2, campaign_id: 3, name: 'Mouse' },
  { id: 3, player_id: 3, campaign_id: 3, name: 'Sticky' }
]
characters.each{|character| Character.create!(character)}

items = [
  { id: 1, character_id: 1, campaign_id: 3, name: 'Diocles', description: 'Adamantine Gladius', value: 500 },
  { id: 2, character_id: 2, campaign_id: 3, name: 'Lucille', description: 'Coilgun', value: 500 },
  { id: 3, character_id: 3, campaign_id: 3, name: 'Revolver', description: 'Distance Enchant', value: 500 },
  { id: 4, character_id: 3, campaign_id: 3, name: 'Revolver', description: 'Distance Enchant', value: 500 },
  { id: 5, character_id: nil, campaign_id: 3, name: 'Random Thing 05', description: 'Probably Junk', value: 0 },
  { id: 6, character_id: nil, campaign_id: 3, name: 'Random Thing 06', description: 'Probably Junk', value: 0 },
  { id: 7, character_id: nil, campaign_id: 3, name: 'Random Thing 07', description: 'Probably Junk', value: 0 },
  { id: 8, character_id: nil, campaign_id: 3, name: 'Random Thing 08', description: 'Probably Junk', value: 0 },
  { id: 9, character_id: nil, campaign_id: 3, name: 'Random Thing 09', description: 'Probably Junk', value: 0 },
  { id: 10, character_id: nil, campaign_id: 3, name: 'Random Thing 10', description: 'Probably Junk', value: 0 },
  { id: 11, character_id: nil, campaign_id: 3, name: 'Random Thing 11', description: 'Probably Junk', value: 0 },
  { id: 12, character_id: nil, campaign_id: 2, name: 'Random Thing 01', description: 'Probably Junk', value: 0 },
  { id: 13, character_id: nil, campaign_id: 2, name: 'Random Thing 02', description: 'Probably Junk', value: 0 },
  { id: 14, character_id: nil, campaign_id: 2, name: 'Random Thing 03', description: 'Probably Junk', value: 0 },
  { id: 15, character_id: nil, campaign_id: 2, name: 'Random Thing 04', description: 'Probably Junk', value: 0 }
]
items.each{|item| Item.create!(item)}

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