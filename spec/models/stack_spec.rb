require 'rails_helper'

RSpec.describe Stack do

  let (:inventory) { create :inventory }
  let (:item1) { create :item }
  let (:item2) { create :item }
  let (:stack1) { create :stack, inventory: inventory, item: item1, position: 1 }
  let (:stack2a) { create :stack, inventory: inventory, item: item2, position: 2 }
  let (:stack2b) { create :stack, inventory: inventory, item: item2, position: 3 }

  before do
    @inventory = create :inventory
    @item1 = create :item
    @item2 = create :item
  end

  it 'cannot be placed on top of an existing stack' do
    stack1 = create :stack, inventory: @inventory, position: 1
    stack2 = create :stack, inventory: @inventory, position: 2
    expect {stack1.update!(position: stack2.position)}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Position There is already a stack of items in that spot.')
  end

  context "combination" do
    it 'is prevented when item_id does not match' do
      stack1 = create :stack, inventory: @inventory, item: @item1
      stack2 = create :stack, inventory: @inventory, item: @item2
      expect(stack1.combine(stack2)).to eq false
      expect(stack1.errors.messages[:item_id]).to include 'mismatch'
    end
    it 'updates both stacks' do
      stack1 = create :stack, inventory: @inventory, item: @item1
      stack2 = create :stack, inventory: @inventory, item: @item1
      initial_quantity = stack1.quantity
      stack2.combine(stack1)
      expect(stack1.quantity).to eq(initial_quantity + stack2.quantity)
      expect(stack2.discarded_at).not_to be_nil
    end
  end

  context "split" do
    before(:each) do
      @stack = create :stack
    end
    
    it 'fails when requested stack size exceed quantity' do
      expect(@stack.split(@stack.quantity + 10)).to eq false
      expect(@stack.errors.messages[:quantity]).to include 'insufficient quantity'
    end
    it 'reduces the quantity by the requested stack size' do
      initial_quantity = @stack.quantity
      @stack.split(5)
      expect(@stack.quantity).to eq(initial_quantity - 5)
    end
    it 'creates a new stack of the requested size' do 
      # expect(Stack).to receive(:create!)
      # expect { new_stack = @stack.split(5) }.to change { Stack.count }.by(1)
    end
  end
end
