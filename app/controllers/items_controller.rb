class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :create]
  
  def index
    @items = Item.kept.where(campaign_id: params[:campaign_id])
    serialize(@items)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      serialize(@item)
    else
      render status: 400, json: @item.errors
    end
  end

  def update
    if @item.update_attributes(item_params)
      serialize(@item)
    else
      render status: 400, json: @item.errors
    end
  end

  def destroy
    if @item.discard
      render json: {status: 202, message:'deleted'}
    else
      render status: 400, json: @item.errors
    end
  end

  private 

  def set_item
    @item = Item.find(params[:id])
  end

  def serialize(target)
    render json: ItemSerializer.new(target)
  end

  def item_params
    params.require(:item).permit(:name, :description, :value, :campaign_id, :character_id)
  end

end