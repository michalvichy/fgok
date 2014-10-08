require 'rails_helper'

RSpec.describe Dashboard::ArticlesController, type: :routing do
  describe 'routing' do
    let(:path) { 'dashboard/articles' }

    it 'routes to #index' do
      expect(get: "/#{path}").to route_to("#{path}#index")
    end

    it 'routes to #new' do
      expect(get: "/#{path}/new").to route_to("#{path}#new")
    end

    it 'routes to #show' do
      expect(get: "/#{path}/1").to route_to("#{path}#show", id: '1')
    end

    it 'routes to #edit' do
      expect(get: "/#{path}/1/edit").to route_to("#{path}#edit", id: '1')
    end

    it 'routes to #create' do
      expect(post: "/#{path}").to route_to("#{path}#create")
    end

    it 'routes to #update' do
      expect(put: "/#{path}/1").to route_to("#{path}#update", id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: "/#{path}/1").to route_to("#{path}#destroy", id: '1')
    end
  end
end
