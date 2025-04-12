require 'rails_helper'

describe RegistrationsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event) }

  describe 'POST #create' do
    it 'cria uma inscrição e envia o comprovante' do
      post :create, params: { user_id: user.id, event_id: event.id }

      expect(response).to have_http_status(:created)
      expect(response.body).to include('Inscrição confirmada e comprovante enviado!')
    end
  end
end