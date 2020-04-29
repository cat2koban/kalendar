require 'rails_helper'

RSpec.describe 'Kalendars', type: :request do
  describe 'GET /home' do
    it 'returns http success' do
      get '/home'
      expect(response).to have_http_status(:ok)
    end
  end
end
