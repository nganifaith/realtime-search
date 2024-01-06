# app/controllers/search_logs_controller.rb
class SearchLogsController < ApplicationController
  def index
    @search_logs = SearchLog.order('updated_at DESC').paginate(page: params[:page], per_page: 10)
  end
end
