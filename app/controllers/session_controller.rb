class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      render json: UserSerializer.new(user)
    else
      render json: {status: 400, message: 'could not login'}
    end
  end

  def destroy
    render json: {status: 200}
  end

  private

  def session_params
    params.require(:session).permit(:email)
  end

end