require 'rails_helper'

RSpec.describe 'Kalendars', type: :request do
  describe 'GET /' do
    let(:user) { create(:user) }

    context 'when not logged in' do
      it 'returns status 302' do
        get '/'
        expect(response).to have_http_status(:found)
      end
    end

    context 'when logged in' do
      it 'returns status 200' do
        login(user)
        get '/'
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
