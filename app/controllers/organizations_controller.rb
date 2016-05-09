class OrganizationsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def new
    @organization = Organization.new
  end

  def home
    @addresses = Organization.all.map { |o| o.address }
    all_tech_stacks
    search = params[:search]

    @organizations = Organization.where(published: true)
    # @organizations = Organization.search()
    respond_to do |format|
      format.html { render }
      format.json { render json: @organizations.to_json }
      # format.js { render :list_listings }
      # format.js { render :create_map }
    end
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
    @organization = Organization.where(published: true).find(params[:id])
    respond_to do |format|
      format.html { render }
      format.json { render json: @organization.to_json }
    end
  end

  def edit
    @organization = Organization.find params[:id]
    if current_user.admin == false && @organization.user_id != current_user.id
      redirect_to organizations_path
    end
  end

  def update
    @organization = Organization.find params[:id]
    if current_user.admin == false && @organization.user_id != current_user.id
      redirect_to organizations_path
    end

    if @organization.update organization_params
      redirect_to organizations_path
    else
      render :edit
    end
  end

  def destroy
    @organization = Organization.find params[:id]
    if current_user.admin == false && @organization.user_id != current_user.id
      redirect_to organizations_path
    end

    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_path }
      format.js { render :destroy_success }
    end
  end

  def logo
    content = @organization.logo.read
    if stale?(etag: content, last_modified: @organization.updated_at.utc, public: true)
      send_data content, type: @organization.logo.file.content_type, disposition: "inline"
      expires_in 0, public: true
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
