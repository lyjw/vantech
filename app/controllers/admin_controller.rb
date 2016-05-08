class AdminController < ApplicationController
  before_action :authenticate_admin!

  def users
    @users = User.all
  end
end
