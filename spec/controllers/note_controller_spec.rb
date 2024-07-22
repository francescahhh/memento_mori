require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let(:user) { create(:user) }
  let(:note) { create(:note, user: user) }
  let(:valid_attributes) { { title: 'Sample Note', body: 'This is a sample note body.' } }
  let(:invalid_attributes) { { title: '', body: '' } }

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
      it 'creates a new Note' do
        expect {
          post :create, params: { note: valid_attributes }
        }.to change(Note, :count).by(1)
      end

      it 'redirects to the notes index' do
        post :create, params: { note: valid_attributes }
        expect(response).to redirect_to(notes_path)
        expect(flash[:notice]).to eq('Postcard created!')
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e., to display the "new" template)' do
        post :create, params: { note: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested note' do
      note_to_destroy = create(:note, user: user)
      expect {
        delete :destroy, params: { id: note_to_destroy.to_param }
      }.to change(Note, :count).by(-1)
    end

    it 'redirects to the notes list' do
      delete :destroy, params: { id: note.to_param }
      expect(response).to redirect_to(notes_path)
      expect(flash[:notice]).to eq('Postcard deleted.')
    end
  end
end
