class EssaysController < ApplicationController
  before_filter :load_essay, :except => [ :index, :random ]

  respond_to :html

  def index
    @essays = Essay.all
  end

  def show
  end

  def random
    essay = Essay.first(:order => "RANDOM()")
    redirect_to essay
  end

  private

  def load_essay
    @essay = params[:id] ? Essay.find(params[:id]) : Essay.new
  end
end
