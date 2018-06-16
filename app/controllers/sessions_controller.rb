class SessionsController < ApplicationController

  def create
    user = User.find_by(display_name: session_params[:display_name])
    if user
      render json: UserSerializer.new(user)
    else
      render status: :bad_request, message: 'Unable to login'
    end
  end

  def destroy
    render status: 200
  end

  private

  def session_params
    params.require(:session).permit(:display_name)
  end

end