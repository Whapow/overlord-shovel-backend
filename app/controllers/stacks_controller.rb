class StacksController < ApplicationController
  before_action :set_stack, except: [:index, :create]
  
  def index
    @stacks = Stack.kept
    serialize(@stacks)
  end

  def create
    @stack = Stack.new(stack_params)
    if @stack.save
      serialize(@stack)
    else
      render status: 400, json: @stack.errors
    end
  end

  def update
    if @stack.update_attributes(stack_params)
      serialize(@stack)
    else
      render status: 400, json: @stack.errors
    end
  end

  def destroy
    if @stack.discard
      render json: {status: 202, message:'deleted'}
    else
      render status: 400, json: @stack.errors
    end
  end

  private 

  def set_stack
    @stack = Stack.find(params[:id])
  end

  def serialize(target)
    render json: StackSerializer.new(target)
  end

  def stack_params
    params.require(:stack).permit(:inventory_id, :item_id, :quantity, :position)
  end

end