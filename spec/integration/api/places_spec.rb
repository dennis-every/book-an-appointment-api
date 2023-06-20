require 'swagger_helper'

RSpec.describe 'api/places', type: :request do
  path '/api/v1/places' do
    get 'Retrieves a list of places' do
      tags 'Places'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   owner_id: { type: :integer },
                   description: { type: :string },
                   location: { type: :string },
                   rate: { type: :integer },
                   photo: { type: :string }
                 },
                 required: %w[id owner_id description location rate photo]
               }

        run_test!
      end
    end

    post 'Creates a new place' do
      tags 'Places'
      consumes 'application/json'
      parameter name: :place, in: :body, schema: {
        type: :object,
        properties: {
          owner_id: { type: :integer },
          description: { type: :string },
          location: { type: :string },
          rate: { type: :integer },
          photo: { type: :string }
        },
        required: %w[owner_id description location rate photo]
      }

      response '201', 'Created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 owner_id: { type: :integer },
                 description: { type: :string },
                 location: { type: :string },
                 rate: { type: :integer },
                 photo: { type: :string }
               },
               required: %w[id owner_id description location rate photo]

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 errors: { type: :object }
               },
               required: %w[errors]

        run_test!
      end
    end
  end

  path '/api/v1/places/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true

    get 'Retrieves a place by ID' do
      tags 'Places'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 owner_id: { type: :integer },
                 description: { type: :string },
                 location: { type: :string },
                 rate: { type: :integer },
                 photo: { type: :string }
               },
               required: %w[id owner_id description location rate photo]

        run_test!
      end
    end

    delete 'Deletes a place' do
      tags 'Places'
      produces 'application/json'

      response '204', 'No Content' do
        run_test!
      end
    end
  end
end
