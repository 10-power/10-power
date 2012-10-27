class GeneralController < ApplicationController
  def index
    @essays = Essay.where(:is_active => true, :featured => true).order('RANDOM()').limit(2)
  end
end
