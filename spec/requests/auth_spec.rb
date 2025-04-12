require 'rails_helper'

RSpec.describe 'Auth', type: :request do
  describe 'POST /auth' do
    it 'permite o registro de um novo usuário' do
      post '/auth', params: {
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data']['email']).to eq('test@example.com')
    end
  end

  describe 'POST /auth/sign_in' do
    let!(:user) { create(:user, email: 'test@example.com', password: 'password') }

    it 'permite o login de um usuário existente' do
      post '/auth/sign_in', params: {
        email: 'test@example.com',
        password: 'password'
      }

      expect(response).to have_http_status(:ok)
      expect(response.headers).to include('access-token')
    end
  end

  describe 'DELETE /auth/sign_out' do
    let!(:user) { create(:user, email: 'test@example.com', password: 'password') }

    it 'permite o logout de um usuário autenticado' do
      # Realiza o login para obter os tokens
      post '/auth/sign_in', params: {
        email: 'test@example.com',
        password: 'password'
      }

      token = response.headers['access-token']
      client = response.headers['client']
      uid = response.headers['uid']

      # Realiza o logout
      delete '/auth/sign_out', headers: {
        'access-token' => token,
        'client' => client,
        'uid' => uid
      }

      expect(response).to have_http_status(:ok)
    end
  end
end