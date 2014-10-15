require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { create(:image) }
  describe 'belongs to' do
    fit 'album' do
      expect(image).to belong_to :album
    end
  end
end
