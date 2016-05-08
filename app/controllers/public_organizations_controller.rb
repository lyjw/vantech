class PublicOrganizationsController < ApplicationController
  def index
    search = params[:search]
    @organizations = Organization.where("name like ?", "%#{search}%")
    # @organizations = Organization.search()
    respond_to do |format|
      format.html { render }
      format.json { render json: @organizations.to_json }
    end
  end

  def show
    @organization = Organization.find params[:id]
    respond_to do |format|
      format.html { render }
      format.json { render json: @organization.to_json }
    end
  end
end
