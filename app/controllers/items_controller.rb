class ItemsController < ApplicationController
  
  def index
    @items = Item.where(campaign_id: params[:id])
    serialize(@items)
  end

  private 

  def serialize(object)
    render json: ItemSerializer.new(object)
  end

end