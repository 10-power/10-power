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

  def update
    @essay.attributes = params[:essay]

    @essay.save

    respond_with @essay
  end
  alias :create :update

  private

  def load_essay
    @essay = params[:id] ? Essay.find(params[:id]) : Essay.new
  end
end
