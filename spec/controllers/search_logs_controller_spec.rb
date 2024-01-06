# spec/controllers/search_logs_controller_spec.rb

require 'rails_helper'

RSpec.describe SearchLogsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @search_logs with paginated results' do
      search_logs = (1..20).map { |n| SearchLog.create(term: "example#{n}", ip_address: "127.0.0.1", created_at: Time.current) }
      get :index
      expect(assigns(:search_logs)).to be_a(WillPaginate::Collection)
      expect(assigns(:search_logs).length).to eq(15)
      expect(assigns(:search_logs).total_entries).to eq(search_logs.length)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'displays search log details on the page' do
      search_logs = (1..15).map { |n| SearchLog.create(term: "term#{n}", ip_address: "127.0.0.1", created_at: Time.current) }
      get :index
      search_logs.each do |log|
        expect(response.body).to include(log.term)
        expect(response.body).to include(log.ip_address)
        expect(response.body).to include(log.updated_at.to_s)
      end
    end
  end
end
