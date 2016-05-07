class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
    respond_to do |format|
      format.json { render json: @organizations.to_json }
    end
  end

  def create
    organization_params = params.require(:organization).permit(:title, :description, :price)
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to organization_path(@organization)
    # else
    #   render :new
    end
  end

  def show
    @organization = Organization.find params[:id]
    respond_to do |format|
      format.json { render json: @organization.to_json }
    end
  end

  def destroy
    @organization = Organization.find params[:id]
    @organization.destroy

    redirect_to organizations
  end
end
