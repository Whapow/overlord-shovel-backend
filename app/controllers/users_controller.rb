class UsersController < ApplicationController
  skip_before_action :validate_token, only: :create
  before_action :set_user, except: [:index, :create]

  def index
    @users = User.kept
    serialize(@users)
  end

  def show
    serialize(@user)
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