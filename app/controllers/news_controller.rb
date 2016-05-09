class NewsController < ApplicationController
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  def index
    string_search_terms
    if @terms
      page = params[:page] || 1
      @news = GoogleCustomSearchApi.search(@terms, page: page)
    end
  end

  def string_search_terms
    @terms = ""
    NewsSearch.all.each do |term|
      @terms += " #{term.search_term}"
    end
  end
end
