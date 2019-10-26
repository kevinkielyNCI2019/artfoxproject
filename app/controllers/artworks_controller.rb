class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  # GET /artworks
  # GET /artworks.json
  def index
    #@artworks = Artwork.all
    
    if artist_signed_in?
    @artist = Artist.find(current_artist.id)
    @artworks = @artist.artworks.all
    else
      @artworks = Artwork.all
      #redirect_to :root #WHY DID I NEED TO COMMENT OUT THIS???
    end 
    
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
  
   # @artist = Artist.find(current_artist.id)
 
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
  end

  # GET /artworks/1/edit
  def edit
    if artist_signed_in?
    @artist = Artist.find(current_artist.id)
  elsif customer_signed_in?
    @customer = Customer.find(current_customer.id)
    end
  end

  # POST /artworks
  # POST /artworks.json
  def create
  # @artwork = Artwork.new(artwork_params)
   @artwork = current_artist.artworks.new(artwork_params)
   
    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artworks/1
  # PATCH/PUT /artworks/1.json
  def update
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.json
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artworks_url, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artwork_params
      params.require(:artwork).permit(:title, :cat, :desc, :price, :artpic, :sold, :artist_id)
    end
end
