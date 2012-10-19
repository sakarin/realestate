class Admin::FreeSpacesController < Admin::BaseController

  def index
    @search = FreeSpace.search(params[:q])
    @free_spaces = @search.result.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.json  { render :json => @free_spaces }
    end
  end

  def new
    @free_space = FreeSpace.new
  end

  def edit
    @free_space = FreeSpace.find(params[:id])
  end

  def create
    @free_space = FreeSpace.new(params[:free_space])

    respond_to do |format|
      if @free_space.save
        format.html { redirect_to admin_free_spaces_path, notice: t('admin.free_spaces.created') }
        format.json { render json: @free_space, status: :created, location: @free_space }
      else
        format.html { render action: "new" }
        format.json { render json: @free_space.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @free_space = FreeSpace.find(params[:id])

    respond_to do |format|
      if @free_space.update_attributes(params[:free_space])
        format.html { redirect_to admin_free_spaces_path, notice: t('admin.free_spaces.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @free_space.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @free_space = FreeSpace.find(params[:id])
    @free_space.destroy

    respond_to do |format|
      format.html { redirect_to admin_free_spaces_url }
      format.json { head :no_content }
    end
  end

  def multi_destroy
    unless params[:free_space_ids].nil?
      @free_spaces = FreeSpace.find(params[:free_space_ids])
      @free_spaces.each { |free_space| free_space.destroy }
    end
    respond_to do |format|
      format.html { redirect_to admin_free_spaces_url }
      format.json { head :no_content }
    end

  end

end
