class ArtworkFavoritesController < ApplicationController
  def update
    favorite = Favorite.where(artwork: Artwork.find(params[:artwork]), customer: current_customer)
    if favorite == []
      # create the favourite
      Favorite.create(artwork: Artwork.find(params[:artwork]), customer: current_customer)
      @favorite_exists = true
    else
      # delete the favroutie
      favorite.destroy_all
      @favorite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
      
    end
  end
end
