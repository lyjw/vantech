class UsersController < ApplicationController
  before_action :user_params, only: [:edit, :update, :destroy]

  def index
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation]))

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation]))
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    @user = User.find params[:id]
  end
end
