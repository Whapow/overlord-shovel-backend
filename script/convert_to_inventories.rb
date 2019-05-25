core_items = {}
def convert_items_into_inventory(items, inventory, core_items)
  items.each do |item|
    stacks = inventory.stacks
    results = determine_item_and_quantity(core_items, item)
    core_items = results[:core_items]
    target_item = results[:item]

    existing_stack = stacks.find_by(item: target_item)
    if existing_stack
      existing_stack.update(quantity: existing_stack.quantity + results[:quantity])
    else
      inventory.stacks.create(item: target_item, quantity: results[:quantity])
    end
    item.discard unless item == target_item
  end
  core_items
end

def determine_item_and_quantity(core_items, item)
  quantity_regex = /x([0-9]+)|([0-9]+)x|\(([0-9]+)\)/
  quantity = (quantity_regex.match(item.name).to_a.compact.last || 1).to_i
  trimmed_name = item.name.gsub(quantity_regex,'').gsub(/^\s*|\s*$/, '').downcase
  item.update(name: trimmed_name.titleize)
  target_item = (core_items[trimmed_name] ||= item)
  if core_items[trimmed_name].value == 0 && item.value != 0
    core_items[trimmed_name].update(value: (quantity > 1 ? (item.value / quantity) : item.value)) 
  end
  toReturn = {
    item: target_item, 
    core_items: core_items, 
    quantity: quantity
  }
end

Character.all.each do |character|
  character.build_inventory.save unless character.inventory
  core_items = convert_items_into_inventory(character.items, character.inventory, core_items)
end

Campaign.all.each do |campaign|
  campaign.inventories.build.save unless campaign.inventories.size > 0
  core_items = convert_items_into_inventory(campaign.items.where(character_id: nil), campaign.inventories.first, core_items)
end