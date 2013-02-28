class Admin::FacilitiesController < Admin::BaseController

  def index
    @search = Facility.search(params[:q])
    @facilities = @search.result.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.json  { render :json => @facilities }
    end
  end

  def new
    @facility = Facility.new
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def create
    @facility = Facility.new(params[:facility])

    respond_to do |format|
      if @facility.save
        format.html { redirect_to admin_facilities_path, notice: t('admin.facilities.created') }
        format.json { render json: @facility, status: :created, location: @facility }
      else
        format.html { render action: "new" }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @facility = Facility.find(params[:id])

    respond_to do |format|
      if @facility.update_attributes(params[:facility])
        format.html { redirect_to admin_facilities_path, notice: t('admin.facilities.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy

    respond_to do |format|
      format.html { redirect_to admin_facilities_url }
      format.json { head :no_content }
    end
  end

  def multi_destroy
    unless params[:facility_ids].nil?
      @facilities = Facility.find(params[:facility_ids])
      @facilities.each { |facility| facility.destroy }
    end
    respond_to do |format|
      format.html { redirect_to admin_facilities_url }
      format.json { head :no_content }
    end

  end

end
