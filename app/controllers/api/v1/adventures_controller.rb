class Api::V1::AdventuresController < ApplicationController

  def show
    adventure = Adventure.find(params[:id])
    render(json: AdventureSerializer.new(adventure))
  end

  def create
    params[:adventure] = JSON.parse(request.raw_post)
    adventure = Adventure.new(adventure_params(params[:adventure]))
      if adventure.save
        user = User.find(params["user_id"])
        UserAdventure.create!(user_id: user.id, adventure_id: adventure.id)
        json_response(AdventureSerializer.new(adventure), :created)
      else
        render json: { status: 'ERROR', message: "#{adventure.errors.full_messages.to_sentence}", data: adventure.errors}, status: :bad_request
    end
  end

  def update
    params = JSON.parse(request.raw_post)
    adventure = Adventure.find(params["id"])
    adventure.update(adventure_params)
    if adventure.save
        json_response(AdventureSerializer.new(adventure), :created)
    else
      render json: { status: 'ERROR', message: "#{adventure.errors.full_messages.to_sentence}", data: adventure.errors}, status: :bad_request
    end
  end

  def destroy
    Adventure.find(params[:id]).delete
    render json: {message: "Adventure successfully deleted.", status: 200}
  end

  private
  def adventure_params(params_adventure)
    if params_adventure["favorite"] == "true"
      params_adventure["favorite"] = true
    elsif params_adventure["favorite"] == "false"
      params_adventure["favorite"] = false
    end
    params_adventure["date"] = params_adventure["date"].to_datetime
    params[:adventure].except(:user_id).permit(
      :guest_email_addresses,
      :date,
      :comment,
      :activities,
      :favorite,
      :rec_area_id)
  end
end
