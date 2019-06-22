# == Schema Information
#
# Table name: stacks
#
#  id           :bigint(8)        not null, primary key
#  item_id      :integer
#  inventory_id :string
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class StackSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :inventory_id, :item_id, :quantity
  belongs_to :inventory 
  belongs_to :item
end
