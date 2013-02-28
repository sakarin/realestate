class Admin::PostGroupsController <  Admin::BaseController

  def index
    @search = PostGroup.search(params[:q])
    @post_groups = @search.result.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.json  { render :json => @post_groups }
    end
  end

  def new
    @post_group = PostGroup.new
    #@post_groups = PostGroup.all
  end

  def edit
    @post_group = PostGroup.find(params[:id])
  end

  def create
    @post_group = PostGroup.new(params[:post_group])

    respond_to do |format|
      if @post_group.save
        format.html { redirect_to admin_post_groups_path, notice: t('admin.post_groups.created') }
        format.json { render json: @post_group, status: :created, location: @post_group }
      else
        format.html { render action: "new" }
        format.json { render json: @post_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post_group = PostGroup.find(params[:id])

    respond_to do |format|
      if @post_group.update_attributes(params[:post_group])
        format.html { redirect_to admin_post_groups_path, notice: t('admin.post_groups.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post_group = PostGroup.find(params[:id])
    @post_group.destroy

    respond_to do |format|
      format.html { redirect_to admin_post_groups_url }
      format.json { head :no_content }
    end
  end

  def multi_destroy
    unless params[:post_group_ids].nil?
      @post_groups = PostGroup.find(params[:post_group_ids])
      @post_groups.each { |post_group| post_group.destroy }
    end
    respond_to do |format|
      format.html { redirect_to admin_post_groups_url }
      format.json { head :no_content }
    end

  end

end
