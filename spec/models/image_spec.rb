require 'rails_helper'

RSpec.describe Image, type: :model do
  it 'belongs to album' do
    expect(subject).to belong_to :album
  end
end
