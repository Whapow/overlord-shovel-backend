class JournalsController < ApplicationController
  before_action :set_journal, except: [:index, :create]

  def index
    @journals = Journal.where(campaign_id: params[:id])
    serialize(@journals)
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      serialize(@journal)
    else
      render json: @journal.errors
    end
  end

  def update
    if @journal.update_attributes(journal_params)
      serialize(@journal)
    else
      render json: @journal.errors
    end
  end

  def destroy 
    if @journal.discard
      render json: {status: 202, message: 'deleted'}
    else
      render json: @journal.errors
    end
  end

  private 

  def set_journal
    @journal = Journal.find(params[:id])
  end

  def serialize(target)
    render json: JournalSerializer.new(target)
  end

  def journal_params
    params.require(:journal).permit(:name, :campaign_id)
  end
end