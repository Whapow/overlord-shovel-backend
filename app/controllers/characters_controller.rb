class CharactersController < ApplicationController
  before_action :set_character, except: [:index, :create]

  def index
    if params[:campaign_id]
      @characters = Character.kept.where(campaign_id: params[:campaign_id])
    elsif params[:user_id]
      @characters = Character.kept.where(user_id: params[:user_id]) 
    else
      @characters = Character.kept
    end
    serialize(@characters)
  end

  def create
    @character = Character.new(character_params)
    @character.inventory = Inventory.new()
    if @character.save
      serialize(@character)
    else
      render status: 400, json: @character.errors
    end
  end

  def update
    if @character.update_attributes(character_params)
      serialize(@character)
    else
      render status: 400, json: @character.errors
    end
  end

  def destroy
    if @character.discard
      render status: 202, message: 'deleted'
    else
      render status: 400, json: @character.errors
    end
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def serialize(target)
    render json: CharacterSerializer.new(target)
  end

  def character_params
    params.require(:character).permit(:name, :player_id, :campaign_id)
  end

end