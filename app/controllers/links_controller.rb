class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @recent_links = Link.by_user(current_user).recent.limit(5)
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
    @link = current_user.links.find(params[:id])
  end

  def update
    link = current_user.links.find(params[:id])
    if link.update(link_params)
      redirect_to link, notice: "Link updated!"
    else
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
