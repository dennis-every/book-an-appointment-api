module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        user = User.create!(name: params[:name])
        if user
          render json: { message: 'Signed up successfully', id: user.id, name: user.name }
        else
          render json: { error: 'An error occurred' }, status: :unauthorized
        end
      end
    end
  end
end
