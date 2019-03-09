class SessionsController < ApplicationController
  skip_before_action :validate_token, only: :create

  def create
    @user = User.find_by_username(session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      @user.session.try(:destroy)
      @session = Session.create!(user: @user)
      render json: SessionSerializer.new(@session)
    else
      render status: :bad_request, message: 'Unable to login'
    end
  end

  def destroy
    render status: 200
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

end