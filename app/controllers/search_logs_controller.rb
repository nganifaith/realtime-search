class SearchLogsController < ApplicationController
  def index
    @search_logs = SearchLog
      .select('term, COUNT(*) as count, ip_address, updated_at')
      .group(:term)
      .order('count DESC, created_at DESC')
      .paginate(page: params[:page], per_page: 15)
  end
end
