class Account::ImagesController < Account::BaseController
  respond_to :html, :json

  def index
    @images = Image.order("position")

  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create

    @listing = Listing.find(params[:listing_id])

    @image = Image.create(params[:image])
    @image.listing = @listing
    @image.save


  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      respond_with @image
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:listing_id])

    @image = Image.find(params[:id])
    @image.destroy
    #redirect_to edit_account_listing_path(@listing), notice: "Image was successfully destroyed."
    redirect_to edit_account_listing_path(@listing)
    #render :edit
  end

  def sort
    params[:image].each_with_index do |id, index|
      Image.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
