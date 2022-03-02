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
      render json: { status: 'ERROR', message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request
    end
  end

  def update
    non_auth_user_params = JSON.parse(request.raw_post)
    user = User.find(non_auth_user_params["id"])
    user.update(non_auth_user_params)
    if user.save
      user.add_coordinates
      json_response(UserSerializer.new(user), :created)
    else
      render json: { status: 'ERROR', message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request
    end
  end

  def destroy
    User.find(params[:id]).delete
    render json: {message: "Account successfully deleted.", status: 200}
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
