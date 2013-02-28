class Admin::ExpertsController < Admin::BaseController

  def index
    @search = Expert.search(params[:q])
    @experts = @search.result.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.json  { render :json => @experts }
    end
  end

  def new
    @expert = Expert.new
  end

  def edit
    @expert = Expert.find(params[:id])
  end

  def create
    @expert = Expert.new(params[:expert])

    respond_to do |format|
      if @expert.save
        format.html { redirect_to admin_experts_path, notice: t('admin.experts.created') }
        format.json { render json: @expert, status: :created, location: @expert }
      else
        format.html { render action: "new" }
        format.json { render json: @expert.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @expert = Expert.find(params[:id])

    respond_to do |format|
      if @expert.update_attributes(params[:expert])
        format.html { redirect_to admin_experts_path, notice: t('admin.experts.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expert.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expert = Expert.find(params[:id])
    @expert.destroy

    respond_to do |format|
      format.html { redirect_to admin_experts_url }
      format.json { head :no_content }
    end
  end

  def multi_destroy
    unless params[:expert_ids].nil?
      @experts = Expert.find(params[:expert_ids])
      @experts.each { |expert| expert.destroy }
    end
    respond_to do |format|
      format.html { redirect_to admin_experts_url }
      format.json { head :no_content }
    end

  end

end
