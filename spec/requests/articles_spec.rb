require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #search' do
    let(:ip_address) { '127.0.0.1' }

    it 'renders the search_results partial' do
      post :search, params: { search_term: 'test' }
      expect(response).to render_template(partial: '_search_results')
    end

    it 'logs the search term' do
      expect { post :search, params: { search_term: 'test' } }.to change(SearchLog, :count).by(1)
    end
  end
end
