class GeneralController < ApplicationController
  def index
    @essays = Essay.order('RANDOM()').limit(2).all
  end
end
