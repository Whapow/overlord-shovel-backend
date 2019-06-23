module Wiki
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :update, :delete]

    def index
      campaign = Campaign.find(params[:campaign_id])
      if campaign.user == @session.user
        serialize campaign.pages
      else 
        serialize campaign.pages.where(visible: true)
      end
    end

    def show
      render status: 401 unless @page.visible || @page.campaign.user == @session.user
      serialize @page
    end

    private 

    def serialize(target)
      render json: Wiki::PageSerializer.new(target)
    end

    def set_page
      @page = Wiki::Page.find(params[:id])
    end
  end
end