class ClicksController < ApplicationController
  def create
    link = Link.find(params[:link_id])
    Click.create!(clickable: link, user: current_user)

    respond_to do |format|
      format.json { render json: { status: :ok } }
    end
  end
end
