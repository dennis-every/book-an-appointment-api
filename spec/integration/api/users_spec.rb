require 'swagger_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  path '/api/v1/users' do
    get('Retrieve a list of users') do
      tags 'Users'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   photo: { type: :string }
                 },
                 required: %i[id name]
               }

        run_test!
      end
    end

    post('Create a new user') do
      tags 'Users'
      consumes 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          photo: { type: :string }
        },
        required: [:name]
      }

      response '201', 'Created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo: { type: :string }
               },
               required: %i[id name]

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   properties: {
                     name: { type: :array, items: { type: :string } }
                   }
                 }
               },
               required: [:errors]

        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'User ID'

    get('Retrieve a specific user') do
      tags 'Users'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo: { type: :string }
               },
               required: %i[id name]

        run_test!
      end
    end

    delete('Delete a specific user') do
      tags 'Users'
      produces 'application/json'

      response '204', 'No Content' do
        run_test!
      end
    end
  end
end
