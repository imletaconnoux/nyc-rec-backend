class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  # create method for post requests
  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({user_id: user.id})
      render json: {user: user, jwt: token}, status: 201
    end
  end

  def me
    #should be able to retrieve user and their prefs
    if @user
      render json: {user: @user, user_prefs: @user.user_prefs}, status: 201
    else
      render json: {message: "Error"}
    end
  end

  private
  def user_params
    params.permit(:username, :password)
  end

end
