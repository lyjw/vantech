class TechStacksController < ApplicationController
  def index
    @tech_stacks = TechStack.all
    respond_to do |format|
      format.json { render json: @tech_stacks.to_json }
    end
  end

  def create
    tech_stack_params = params.require(:tech_stack).permit(:title, :description, :price)
    @tech_stack = TechStack.new(tech_stack_params)

    if @tech_stack.save
      redirect_to tech_stack_path(@tech_stack)
    # else
    #   render :new
    end
  end

  def show
    @tech_stack = TechStack.find params[:id]
    respond_to do |format|
      # format.html { render :show }
      # format.js {render json: @tech_stack }
      # format.js { render js: "alert('Can\'t work, please refresh the page!');" }
      format.json { render json: @tech_stack.to_json }
    end
    # render :show
  end

end
