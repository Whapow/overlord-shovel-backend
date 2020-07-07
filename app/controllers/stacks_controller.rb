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
  
  def combine
    return status: 404, json: {error: ""} unless to_stack = Stack.find(params[:to_stack_id])
    if @stack.combine(to_stack)
      render json: {status: 202, message:'combined'}
    else
      render status: 400, json: @stack.errors
    end
  end

  def split
    if new_stack = @stack.split(params[:stack_size])
      serialize(new_stack)
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