class Admin::PhotosController < ApplicationController
  before_filter :load_essay
  before_filter :load_photo, :except => [ :index ]

  respond_to :json

  def index
    @photos = @essay.photos
  end

  def new
  end

  def edit
  end

  def update
    @photo.attributes = Photo.filter_attributes(params)

    if @photo.save
      respond_with :admin, @photo, :location => admin_essay_photo_url(@essay.id, @photo.id)
    else
      respond_with :admin, @photo
    end
  end
  alias :create :update

  def destroy
    @photo.destroy

    respond_with @photo
  end

  private

  def load_essay
    @essay = Essay.find_by_id(params[:essay_id])
  end

  def load_photo
    @photo = params[:id] ? @essay.photos.find_by_id(params[:id]) : @essay.photos.build
  end
end
