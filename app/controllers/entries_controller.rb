class EntriesController < ApplicationController
  before_action :set_entry, except: [:index, :create]

  def index
    @entries = Entry.kept.where(journal_id: params[:id])
    serialize(@entries)
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      serialize(@entry)
    else
      render json: @entry.errors
    end
  end

  def update
    if @entry.update_attributes(entry_params)
      serialize(@entry)
    else
      render json: @entry.errors
    end
  end

  def destroy
    if @entry.discard
      render json: { status: 202, message: 'deleted' }
    else
      render json: @entry.errors
    end
  end

  private

  def serialize(target)
    render json: EntrySerializer.new(target)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:journal_id, :character_id, :reward, :experience)
  end

end