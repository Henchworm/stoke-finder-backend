class Api::V1::AdventuresController < ApplicationController

  def create
    params = JSON.parse(request.raw_post)
    adventure = Adventure.new(adventure_params)
      if adventure.save
          UserAdventure.create!(user_id: params["user_id"], adventure_id: adventure.id)
          json_response(AdventureSerializer.new(adventure), :created)
      else
        render json: { status: 'ERROR', message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request
    end
  end

  private
  def adventure_params
    params.require(:adventure).except(:user_id).permit(
      :guest_email_addresses,
      :date,
      :comment,
      :activities,
      :favorite,
      :rec_area_id
    )
  end
end