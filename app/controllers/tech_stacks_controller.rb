class TechStacksController < ApplicationController
  before_action :authenticate_admin!, only:[:create, :destroy]

  def index
    @tech_stacks = TechStack.all
    respond_to do |format|
      format.json { render json: @tech_stacks.to_json }
    end
  end

  def create
    tech_stack_params = params.require(:tech_stack).permit(:name)
    @tech_stack = TechStack.new(tech_stack_params)

    respond_to do |format|
      if @tech_stack.save
        format.js { render :create_success }
      else
        format.js { render :create_failure }
      end
    end
  end

  def new
    @tech_stack = TechStack.new
    render :new
  end

  def destroy
    @tech_stack = TechStack.find params[:id]
    @tech_stack.destroy
    respond_to do |format|
      format.js { render :delete_success }
    end
  end
end
