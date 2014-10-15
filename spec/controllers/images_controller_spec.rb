require 'rails_helper'

RSpec.describe ImagesController, type: controller do
  describe 'GET index' do
    let(:image) { create(:image) }

    it 'assigns all images as @images' do
      get :index
      expect(assigns(images)).to eq([image])
    end
  end

  describe 'GET show' do
    it 'assigns the requested image as @image' do
      get :show, id: image
      expect(assigns(image)).to eq(image)
    end
  end
end
