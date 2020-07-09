class PicturesController < ApplicationController
  load_and_authorize_resource

  def destroy
    @picture.destroy
    render nothing: true
  end
end
