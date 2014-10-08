require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do

  describe 'GET index' do
    it 'assigns all dashboards as @dashboards' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
