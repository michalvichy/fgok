require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let(:album) { create(:album) }

  describe 'GET index' do
    it 'assigns all albums as @albums' do
      get :index
      expect(assigns(:albums)).to eq([album])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns the requested album as @album' do
      get :show, id: album
      expect(assigns(:album)).to eq(album)
    end
  end
end
