class CampaignsController < ApplicationController
  before_action :set_campaign, except: [:index]

  def index
    @campaigns = Campaign.all
    serialize @campaigns
  end

  def show
    serialize @campaign
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def serialize(object)
    render json: CampaignSerializer.new(object)
  end

end