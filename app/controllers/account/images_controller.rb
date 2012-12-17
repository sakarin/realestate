class Account::ImagesController < Account::BaseController
  respond_to :html, :json

  def index

  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create

    @image = Image.new(params[:image])
    @image.session_id= session[:session_id]
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
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to account_images_url, notice: "Image was successfully destroyed."
  end
end
