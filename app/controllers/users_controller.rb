class UsersController < ApplicationController
  skip_before_action :validate_token, only: [:create, :forgot_password, :reset_password]
  before_action :set_user, only: [:show, :update, :destroy, :reset_password]

  def index
    @users = User.kept
    serialize(@users)
  end

  def show
    serialize(@user)
  end

  def profile
    serialize(@session.user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      serialize(@user)
    else
      render status: 400, json: @user.errors
    end
  end

  def update
    render status: 401 unless params[:user][:password].blank? || 
                              @user.authenticate(params[:user][:old_password])                     
    if @user.update_attributes(user_params)
      serialize(@user)
    else
      render status: 400, json: @user.errors
    end
  end

  def destroy
    if @user.discard
      render status: 202, message: 'deleted'
    else
      render status: 400, json: @user.errors
    end
  end

  def forgot_password
    u = User.arel_table
    @user = User.where(u[:email].matches(params[:email])).first || 
            User.where(u[:username].matches(params[:username])).first
    if @user
      @user.update(reset_token: SecureRandom.urlsafe_base64(nil, false))
      UserMailer.password_reset(@user).deliver
      render status: 200, json: @user
    else
      render status: 400, json: {error: "Could not find a user with that email/username"}
    end  
  end

  def reset_password
    if @user.reset_token == params[:reset_token]
      @user.update(password: params[:password], reset_token: nil)
      render status: 200
    else
      render status: 400, json: {error: "Invalid reset token"}
    end  
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def serialize(target)
    render json: UserSerializer.new(target)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end