# == Schema Information
#
# Table name: item_slots
#
#  id           :bigint(8)        not null, primary key
#  item_id      :integer
#  inventory_id :string
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ItemSlot < ApplicationRecord
  belongs_to :inventory
  belongs_to :item
end
