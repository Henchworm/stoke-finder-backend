class Api::V1::UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    user.add_coordinates
    render(json: UserSerializer.new(user))
  end

  def create
    non_auth_user_params = JSON.parse(request.raw_post)
    user = User.new(non_auth_user_params)
    if user.save
      user.add_coordinates
      json_response(UserSerializer.new(user), :created)
    else
      render json: { status: 400, message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request
    end
  end

  def update
    non_auth_user_params = JSON.parse(request.raw_post)
    user = User.update(non_auth_user_params["id"], non_auth_user_params)
    if params[:id].to_i != non_auth_user_params["id"]
      render json: { status: "ERROR", message: "User ID does not match a current user.", data: user.errors}, status: :bad_request
    elsif user.save
      user.add_coordinates
      json_response(UserSerializer.new(user))
    else
      render json: { status: "ERROR", message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request
    end
  end

  private
  def non_auth_user_params
    params["user"]["activity_preferences"] = params["user"]["activity_preferences"].join(" ")
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :access, :street_address, :city, :state, :zipcode, :activity_preferences)
  end

  def outh_user
    dlfkjsldkfjs
  end
end
