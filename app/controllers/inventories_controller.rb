class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show]

  def show
    serialize @inventory
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def serialize(target)
    render json: InventorySerializer.new(target)
  end
end