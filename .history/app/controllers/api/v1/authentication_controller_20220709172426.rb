# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      def create
        p params.require(:username).inspect
        p params.require(:password).inspect


        render json: { token: '123' }, status: :created
      end
    end
  end
end
