class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.admin
        redirect_to users_path, notice: "Welcome #{@user.first_name.capitalize}!"
      else
        redirect_to users_path, notice: "Welcome #{@user.first_name.capitalize}!"
      end
    else
      flash[:alert] = "Wrong Username or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end
