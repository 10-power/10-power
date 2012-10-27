class GeneralController < ApplicationController
  def index
    @essays = Essay.where(:is_active => true, :is_featured => true).order('RANDOM()').limit(2)
  end
end
