class ClaimOrganizationsController < ApplicationController

  def new
    # byebug
    # @pending = PendingRequest.new
    # @pending.user = current_user
    # # maybe make a collention on a sub route
    # @pending.organization = ""
  end

  def create
  end

  def destroy
    # pending = PendingRequest.find params[:id]
    # accepted_user = pending.user
    # buissness     = pending.buissness
    # buissness.user = accepted_user
    # pending.destroy
  end

  def index
    @pendings = PendingRequest.all
  end
end
