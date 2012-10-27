class Admin::EssaysController < Admin::ApplicationController
  before_filter :load_essay, :except => [ :index ]

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
    @essay.attributes = params[:essay]

    if @essay.save
      respond_with :admin, @essay, :location => edit_admin_essay_path(@essay)
    else
      respond_with :admin, @essay
    end
  end

  def update
    @essay.attributes = params[:essay]

    @essay.save

    respond_with :admin, @essay
  end

  private

  def load_essay
    @essay = params[:id] ? Essay.find(params[:id]) : Essay.new
  end
end
