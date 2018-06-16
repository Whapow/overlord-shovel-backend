class CampaignsController < ApplicationController
  before_action :set_campaign, except: [:index, :create]

  def index
    @campaigns = Campaign.kept
    serialize @campaigns
  end

  def show
    serialize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      serialize(@campaign)
    else
      render json: @campaign.errors
    end
  end

  def update
    if @campaign.update_attributes(campaign_params)
      serialize(@campaign)
    else
      render json: @campaign.errors
    end
  end

  def destroy
    if @campaign.discard
      render json: {status: 202, message: 'deleted'}
    else
      render json: @campaign.errors
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def serialize(target)
    render json: CampaignSerializer.new(target)
  end

  def campaign_params
    params.require(:campaign).permit(:name, :gm_id)
  end

end