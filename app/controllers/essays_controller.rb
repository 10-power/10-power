class EssaysController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show, :random ]

  respond_to :html

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
    @essay = Essay.find(params[:id])
    raise ActiveRecord::RecordNotFound if @essay.user_id != current_user.id
  end

  def create
    @essay = Essay.new
    @essay.user_id = current_user.id
    @essay.attributes = params[:essay]

    @essay.save

    respond_with @essay
  end

  def random
    essay = Essay.first(:order => "RANDOM()")
    redirect_to essay
  end

end
