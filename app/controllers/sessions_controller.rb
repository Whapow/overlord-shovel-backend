class SessionsController < ApplicationController
  skip_before_action :validate_token, only: :create

  def show
    render json: SessionSerializer.new(@session)
  end

  def create
    @user = User.where(User.arel_table[:username].matches(session_params[:username])).first 
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