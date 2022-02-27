class Api::V1::UsersController < ApplicationController
  def show
  user = User.find(params[:id])
  user.add_coordinates
  render(json: UserSerializer.new(user))
  end
end