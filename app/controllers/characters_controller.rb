class CharactersController < ApplicationController
  before_action :set_character, except: [:index, :create]

  def index
    if params[:id]
      @characters = Character.where(campaign_id: params[:id])
    else
      @characters = Character.all
    end
    serialize(@characters)
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      serialize(@character)
    else
      render json: @character.errors
    end
  end

  def update
    if @character.update_attributes(character_params)
      serialize(@character)
    else
      render json: @character.errors
    end
  end

  def destroy
    if @character.discard
      render json: {status: 202, message: 'deleted'}
    else
      render json: @character.errors
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