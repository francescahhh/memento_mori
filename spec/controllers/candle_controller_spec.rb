require 'rails_helper'

RSpec.describe CandlesController, type: :controller do
  let(:user) { create(:user) }
  let(:candle) { create(:candle, user: user) }
  let(:valid_attributes) { { name: 'Name', lit: true } }
  let(:invalid_attributes) { { name: '', lit: nil } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Candle' do
        expect {
          post :create, params: { candle: valid_attributes }
        }.to change(Candle, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e., to display the "new" template)' do
        post :create, params: { candle: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested candle' do
      candle_to_destroy = create(:candle, user: user)
      expect {
        delete :destroy, params: { id: candle_to_destroy.to_param }
      }.to change(Candle, :count).by(-1)
    end

    it 'redirects to the candles list' do
      delete :destroy, params: { id: candle.to_param }
      expect(response).to redirect_to(candles_path)
      expect(flash[:notice]).to eq('Candle deleted.')
    end
  end
end