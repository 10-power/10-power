class EssaysController < ApplicationController
  def index
    @essays = Essay.all
  end

  def show
    @essay = Essay.find(params[:id])
  end

  def new
    @essay = Essay.new
  end

  def edit
  end

  def create
    @essay = Essay.new
    @essay.user_id = current_user.id
    @essay.attributes = params[:essay]

    @essay.save

    redirect_to essays_path
  end
end
