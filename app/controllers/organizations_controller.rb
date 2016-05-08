class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def index
    @organizations = Organization.all
    respond_to do |format|
      format.html { render }
      format.json { render json: @organizations.to_json }
    end
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to organization_path(@organization)
    else
      render :new
    end
  end

  def show
    @organization = Organization.find params[:id]
    respond_to do |format|
      format.html { render }
      format.json { render json: @organization.to_json }
    end
  end

  def edit
    @organization = Organization.find params[:id]
  end

  def update
    @organization = Organization.find params[:id]
    if @organization.update organization_params
      redirect_to organizations_path(@organization)
    else
      render :edit
    end
  end

  def destroy
    @organization = Organization.find params[:id]
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_path }
      format.js { render :destroy_success }
    end
  end

  private

  def organization_params
    params.require(:organization).permit([:name, :address, :logo,
                                         :overview, :employee_count,
                                         :tech_team_size, :website,
                                         :twitter, :published, {tech_stack_ids: []}])
  end
end
