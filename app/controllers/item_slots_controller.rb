class ItemSlotsController < ApplicationController
  before_action :set_item_slot, except: [:index, :create]
  
  def index
    @item_slots = ItemSlot.kept
    serialize(@item_slots)
  end

  def create
    @item_slot = ItemSlot.new(item_slot_params)
    if @item_slot.save
      serialize(@item_slot)
    else
      render status: 400, json: @item_slot.errors
    end
  end

  def update
    if @item_slot.update_attributes(item_slot_params)
      serialize(@item_slot)
    else
      render status: 400, json: @item_slot.errors
    end
  end

  def destroy
    if @item_slot.discard
      render json: {status: 202, message:'deleted'}
    else
      render status: 400, json: @item_slot.errors
    end
  end

  private 

  def set_item_slot
    @item_slot = ItemSlot.find(params[:id])
  end

  def serialize(target)
    render json: ItemSlotSerializer.new(target)
  end

  def item_slot_params
    params.require(:item_slot).permit(:inventory_id, :item_id, :quantity)
  end

end