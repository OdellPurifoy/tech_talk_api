# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
      def create
        p params.require(:username).inspect
        p params.require(:password).inspect


        render json: { token: '123' }, status: :created
      end

      private

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end
    end
  end
end
