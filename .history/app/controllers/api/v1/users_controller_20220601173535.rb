# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = User.all
    if users
      render json: { users: users }
    else
      render json: { status: 500, errors: ['No users found.'] }
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: { user: user }
    else
      render json: { status: 500, errors: ['User not found'] }
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      token = issue_token(user)
      render json: { user: UserSerializer.new(user), jwt: token }
    elsif user.errors.messages
      render json: { error: user.errors.messages }
    else
      render json: { error: 'User could not be created. Please try again.' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
