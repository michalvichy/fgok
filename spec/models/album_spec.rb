require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'has many images' do
    expect(subject).to have_many(:images)
  end
end
