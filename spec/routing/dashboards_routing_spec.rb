require 'rails_helper'

RSpec.describe DashboardsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/dashboards').to route_to('dashboards#index')
    end
  end
end
