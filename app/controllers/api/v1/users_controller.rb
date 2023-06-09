module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_api_v1_user, only: %i[show update destroy]

      # GET /api/v1/users
      def index
        @api_v1_users = User.all

        render json: @api_v1_users
      end

      # GET /api/v1/users/1
      def show
        render json: @api_v1_user
      end

      # POST /api/v1/users
      def create
        @api_v1_user = User.new(api_v1_user_params)

        if @api_v1_user.save
          render json: @api_v1_user, status: :created, location: api_v1_user_url(@api_v1_user)
        else
          render json: @api_v1_user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/1
      def update
        if @api_v1_user.update(api_v1_user_params)
          render json: @api_v1_user
        else
          render json: @api_v1_user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1
      def destroy
        @api_v1_user.destroy
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_user
        @api_v1_user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def api_v1_user_params
        params.require(:user).permit(:name, :photo)
      end
    end
  end
end
