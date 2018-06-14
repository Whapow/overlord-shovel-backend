class UsersController < ApplicationController
  before_action :set_user, except: [:index, :create]

  def index
    @users = User.all
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
      render json: @user.errors
    end
  end

  def update
    if @user.update_attributes(user_params)
      serialize(@user)
    else
      render json: @user.errors
    end
  end

  def destroy
    if @user.update_attribute(:deleted, true)
      render json: {status: 202, message: 'deleted'}
    else
      render json: @user.errors
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
    params.require(:user).permit(:name, :email)
  end

end