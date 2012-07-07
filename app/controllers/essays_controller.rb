class EssaysController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show, :random ]
  before_filter :load_essay, :except => [ :index, :random ]
  before_filter :protect_essay, :only => [ :edit, :update ]

  respond_to :html

  def index
    @essays = Essay.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @essay.user_id = current_user.id
    @essay.attributes = params[:essay]

    @essay.save

    respond_with @essay
  end

  def update
    @essay.attributes = params[:essay]

    @essay.save

    respond_with @essay
  end

  def random
    essay = Essay.first(:order => "RANDOM()")
    redirect_to essay
  end

  private

  def load_essay
    @essay = params[:id] ? Essay.find(params[:id]) : Essay.new
  end

  def protect_essay
    raise ActiveRecord::RecordNotFound if @essay.user_id != current_user.id
  end
end
