module Wiki
  class SecretsController < ApplicationController

    def index
      page = Page.find(params[:page_id])
      if page.campaign.user == @session.user
        serialize page.secrets
      else 
        serialize page.secrets.where(revealed: true)
      end
    end

    private 

    def serialize(target)
      render json: Wiki::SecretSerializer.new(target)
    end
  end
end