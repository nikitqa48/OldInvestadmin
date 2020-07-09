class GalleryPicturesController < ApplicationController
  load_and_authorize_resource

  def destroy
    @gallery_picture.destroy
    render nothing: true
  end
end
