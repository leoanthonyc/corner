class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @recent_links = Link.by_user(current_user).recent.limit(5)
    @links = Link.by_user(current_user)
    @links = @links.tagged_with(params[:tag]) if params[:tag]
    @tags = Link.by_user(current_user).tag_counts_on(:tags)
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
    params.require(:link).permit(:title, :url, :tag_list)
  end
end
