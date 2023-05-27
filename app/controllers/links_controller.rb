class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      redirect_to link, notice: "Link created!"
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
