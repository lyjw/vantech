class ClaimOrganizationsController < ApplicationController

  def create
    @pending = PendingRequest.new
    @pending.organization = Organization.find params[:organization]
    @pending.user = current_user
    @pending.save
    redirect_to claim_organizations_path
  end

  def edit
    pending = PendingRequest.find params[:id]
    pending_org      = pending.organization
    pending_org.user = pending.user
    if pending_org.save
      redirect_to claim_organizations_path, notice: "Saved"
    else
      redirect_to claim_organizations_path,notice: "Not saved"
    end
    pending.destroy
  end

  def destroy
    pending = PendingRequest.find params[:id]
    pending.destroy
    redirect_to claim_organizations_path
  end

  def index
    redirect_to users_path
  end

  def new
    @pending = PendingRequest.new
    @pending.organization = Organization.find params[:organization]
  end
end
