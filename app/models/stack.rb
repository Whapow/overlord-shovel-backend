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

class Stack < ApplicationRecord
  belongs_to :inventory
  belongs_to :item
  
  validates :position,
    uniqueness: {
      scope: :inventory,
      allow_blank: true,
      message: "There is already a stack of items in that spot."
    }
  
  include Discard::Model
  after_discard do
    update(position: nil)
  end

  def combine(stack)
    return errors.add(:item_id, 'mismatch') && false unless item_id == stack.item_id
    stack.increment!(:quantity, quantity) && discard
  end

  def split(number)
    return errors.add(:quantity, 'insufficient quantity') && false if number > quantity
    decrement!(:quantity, number) if new_stack = Stack.create!(item_id: item_id, inventory_id: inventory_id, quantity: number)
    new_stack
  end
end
