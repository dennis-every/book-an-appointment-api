require 'swagger_helper'

RSpec.describe 'Api::V1::Reservations', type: :request do
  path '/api/v1/users/{user_id}/reservations' do
    parameter name: 'user_id', in: :path, type: :string, description: 'User ID'

    get('Retrieve a list of reservations for a user') do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   customer_id: { type: :integer },
                   place_id: { type: :integer },
                   start_date: { type: :string, format: :date },
                   end_date: { type: :string, format: :date },
                   bill: { type: :number }
                 },
                 required: %i[id customer_id place_id start_date end_date]
               }

        run_test!
      end
    end

    post('Create a new reservation') do
      tags 'Reservations'
      consumes 'application/json'

      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          customer_id: { type: :integer },
          place_id: { type: :integer },
          start_date: { type: :string, format: :date },
          end_date: { type: :string, format: :date },
          bill: { type: :number }
        },
        required: %i[customer_id place_id start_date end_date]
      }

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 customer_id: { type: :integer },
                 place_id: { type: :integer },
                 start_date: { type: :string, format: :date },
                 end_date: { type: :string, format: :date },
                 bill: { type: :number }
               },
               required: %i[id customer_id place_id start_date end_date]

        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'Reservation ID'

    get('Retrieve a specific reservation for a user') do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 customer_id: { type: :integer },
                 place_id: { type: :integer },
                 start_date: { type: :string, format: :date },
                 end_date: { type: :string, format: :date },
                 bill: { type: :number }
               },
               required: %i[id customer_id place_id start_date end_date]

        run_test!
      end
    end

    delete('Delete a reservation for a user') do
      tags 'Reservations'

      response '200', 'OK' do
        run_test!
      end
    end
  end
end
