class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy]

  def index
      @users = User.all
      render json: @users, status: :ok
  end

  def show
      render json: @user, status: :ok
  end

  def create
      @user = User.new(user_params)
      if @user.save
          render json: @user, status: :ok
      else
          render json: { errors: @user.errors.full_message }, status: :unprocessable_entity
      end
  end

  def update
      unless @user.update(user_params)
          render json: { errors: @user.errors.full_message }, status: :unprocessable_entity
      end
  end

  def delete
      @user.destroy
  end

  private

  def user_params
      params.permit(:first_name, :last_name, :username, :email, :password)
  end

  def set_user
      @user = User.find(params[:id])
  end
end

