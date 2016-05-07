class TechStacksController < ApplicationController
  def index
    @tech_stacks = TechStack.all
    respond_to do |format|
      format.json { render json: @tech_stacks.to_json }
    end
  end

  def create
    tech_stack_params = params.require(:tech_stack).permit(:name)
    @tech_stack = TechStack.new(tech_stack_params)

    if @tech_stack.save
      redirect_to tech_stack_path(@tech_stack)
    # else
    #   render :new
    end
  end

  # def show
  #   @tech_stack = TechStack.find params[:id]
  #   respond_to do |format|
  #     format.json { render json: @tech_stack.to_json }
  #   end
  # end

  def destroy
  @tech_stack = TechStack.find params[:id]
  @tech_stack.destroy

  redirect_to tech_stacks
end
end
