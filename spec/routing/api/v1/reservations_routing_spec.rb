require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/users/1/reservations').to route_to('api/v1/reservations#index', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/reservations/1').to route_to('api/v1/reservations#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/reservations').to route_to('api/v1/reservations#create')
    end
  end
end
