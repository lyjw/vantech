class PublicOrganizationsController < ApplicationController
  def index
    search = params[:search]
    @organizations = Organization.where("published = TRUE AND name like ?", "%#{search}%" )
    # @organizations = Organization.where(published: true)
    # @organizations = Organization.search()
    respond_to do |format|
      format.html { render }
      format.json { render json: @organizations.to_json }
    end
  end

  def show
    @organization = Organization.where(published: true).find(params[:id])
    respond_to do |format|
      format.html { render }
      format.json { render json: @organization.to_json }
    end
  end
end
