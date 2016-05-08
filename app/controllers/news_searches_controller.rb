class NewsSearchesController < ApplicationController
  before_action :ordered_search_terms, only: [:index, :create]

  def index
  end

  def new
    @search_term = NewsSearch.new
  end

  def create
    @search_term = NewsSearch.new(params.require(:news_search).permit([:search_term]))

    respond_to do |format|
      if @search_term.save
        format.html { redirect_to search_terms_path, method: :get, notice: "Search Term Created!" }
        format.js { render :create_success, search_terms: @search_terms }
      else
        format.html { redirect_to search_terms_path }
        format.js   { render :create_failure }
      end
    end
  end

  def destroy
    @search_term = NewsSearch.find params[:id]
    @search_term.destroy
    respond_to do |format|
      format.html { redirect_to search_terms_path, method: :get, notice: "Search Term Deleted!" }
      format.js   { render } # this renders /app/views/answers/destroy.js.erb
    end
  end

  private

  def ordered_search_terms
    @search_terms = NewsSearch.order(created_at: :desc)
  end
end
