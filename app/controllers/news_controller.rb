class NewsController < ApplicationController
  def index
    if params[:q]
      page = params[:page] || 1
      @news = GoogleCustomSearchApi.search(params[:q], page: page)
    end
    string_search_terms
  end

  def string_search_terms
    @terms = ""
    NewsSearch.all.each do |term|
      @terms += " #{term.search_term}"
    end
  end
end
