class ArticlesController < ApplicationController
  def index
  end

  def search
    @search_term = params[:search_term]
    @matching_articles = Article.where("title LIKE ? OR body LIKE ?", "%#{@search_term}%", "%#{@search_term}%")
    log_search_term(@search_term, request.remote_ip)
    render partial: 'search_results', locals: { matching_articles: @matching_articles }
  end

  private
    def log_search_term(term, ip_address)
      existing_search_term = SearchLog
                            .where(ip_address: ip_address)
                            .where('created_at >= ?', 1.minute.ago)
                            .order('created_at DESC') # Ensure we get the latest search term
                            .first


      if existing_search_term && existing_search_term.created_at >= 10.seconds.ago
        # Update term because user is probably just correcting a typo
        existing_search_term.update(term: term)
      elsif existing_search_term && term.start_with?(existing_search_term.term)
        # Only update if the new term starts with the existing term
        existing_search_term.update(term: term)
      else
        SearchLog.create(term: term, ip_address: ip_address)
      end
    end
end
