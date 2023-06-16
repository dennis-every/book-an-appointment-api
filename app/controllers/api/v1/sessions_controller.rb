module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(name: params[:name])
        if user
          render json: { message: 'Logged in successfully', id: user.id, name: user.name }
        else
          render json: { error: 'Invalid user' }, status: :unauthorized
        end
      end
    end
  end
end
