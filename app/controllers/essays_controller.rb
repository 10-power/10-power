class EssaysController < ApplicationController
  before_filter :load_essay, :except => [ :index, :random ]

  respond_to :html

  def index
    @essays = Essay.all
  end

  def show
  end

  def random
    essay = Essay.where(:is_active => true).order('RANDOM()').first
    redirect_to essay
  end

  private

  def load_essay
    @essay = params[:id] ? Essay.find_by_id_and_is_active(params[:id], true) : Essay.new
  end
end
