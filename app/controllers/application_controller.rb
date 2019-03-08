require "application_responder"
class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :validate_token
  self.responder = ApplicationResponder
  respond_to :json

  private

  def validate_token
    error_message = {errors: "Please log in."}
    authenticate_with_http_token do |token, options|
      # accepts 'Authorization: Token $token' header
      @api_token = Session.find_by_token(token)
    end
    return render json: error_message, status: :unauthorized unless @api_token
  end
end
