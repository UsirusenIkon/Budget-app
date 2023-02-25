require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  describe 'GET /groups' do
    context 'when user is authenticated' do
      before do
        # create an authenticated user
        @user = FactoryBot.create(:user, :confirmed)
        sign_in @user
      end

      it 'returns http success' do
        get '/groups'
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the login page' do
        get '/groups'
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
