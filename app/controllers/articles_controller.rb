class ArticlesController < ApplicationController
  def index
  end

  def search
    @search_term = params[:search_term]
    @matching_articles = Article.where("title LIKE ? OR body LIKE ?", "%#{@search_term}%", "%#{@search_term}%")
    render partial: 'search_results', locals: { matching_articles: @matching_articles }
  end
end
