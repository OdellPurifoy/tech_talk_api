# frozen_string_literal: true

module Api
    module V1
      class AuthenticationController < ApplicationController
        def create
            p params.inspect

            render json: { status: :created }
        end
      end
    end
end
