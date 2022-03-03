class Api::V1::SessionsController < ApplicationController

  def auth
    data = JSON.parse(request.raw_post)
    user = User.find_by(email: data['email'])
    if user.nil?
      render json: { status: 'OK', message: "CLEAR", data:{}}, status: :ok
    elsif user.present?
      json_response(UserSerializer.new(user), :ok)
    end
  end

  def create
    user_data = JSON.parse(request.raw_post)
    user = User.find_by(user_name: user_data["user_name"])
    if user.present? && user.authenticate(user_data["password"])
      json_response(UserSerializer.new(user), :ok)
    else
      render json: { status: 'ERROR', message: "Invalid username or password", data:{}}, status: :bad_request
    end
  end
end
