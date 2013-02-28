class Admin::FurnituresController < Admin::BaseController

  def index
    @search = Furniture.search(params[:q])
    @furnitures = @search.result.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.json  { render :json => @furnitures }
    end
  end

  def new
    @furniture = Furniture.new
  end

  def edit
    @furniture = Furniture.find(params[:id])
  end

  def create
    @furniture = Furniture.new(params[:furniture])

    respond_to do |format|
      if @furniture.save
        format.html { redirect_to admin_furnitures_path, notice: t('admin.furnitures.created') }
        format.json { render json: @furniture, status: :created, location: @furniture }
      else
        format.html { render action: "new" }
        format.json { render json: @furniture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @furniture = Furniture.find(params[:id])

    respond_to do |format|
      if @furniture.update_attributes(params[:furniture])
        format.html { redirect_to admin_furnitures_path, notice: t('admin.furnitures.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @furniture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @furniture = Furniture.find(params[:id])
    @furniture.destroy

    respond_to do |format|
      format.html { redirect_to admin_furnitures_url }
      format.json { head :no_content }
    end
  end

  def multi_destroy
    unless params[:furniture_ids].nil?
      @furnitures = Furniture.find(params[:furniture_ids])
      @furnitures.each { |furniture| furniture.destroy }
    end
    respond_to do |format|
      format.html { redirect_to admin_furnitures_url }
      format.json { head :no_content }
    end

  end

end
