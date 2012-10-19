class Admin::UnitFeaturesController < Admin::BaseController

  def index
    @search = UnitFeature.search(params[:q])
    @unit_features = @search.result.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.json  { render :json => @unit_features }
    end
  end

  def new
    @unit_feature = UnitFeature.new
  end

  def edit
    @unit_feature = UnitFeature.find(params[:id])
  end

  def create
    @unit_feature = UnitFeature.new(params[:unit_feature])

    respond_to do |format|
      if @unit_feature.save
        format.html { redirect_to admin_unit_features_path, notice: t('admin.unit_features.created') }
        format.json { render json: @unit_feature, status: :created, location: @unit_feature }
      else
        format.html { render action: "new" }
        format.json { render json: @unit_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @unit_feature = UnitFeature.find(params[:id])

    respond_to do |format|
      if @unit_feature.update_attributes(params[:unit_feature])
        format.html { redirect_to admin_unit_features_path, notice: t('admin.unit_features.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @unit_feature = UnitFeature.find(params[:id])
    @unit_feature.destroy

    respond_to do |format|
      format.html { redirect_to admin_unit_features_url }
      format.json { head :no_content }
    end
  end

  def multi_destroy
    unless params[:unit_feature_ids].nil?
      @unit_features = UnitFeature.find(params[:unit_feature_ids])
      @unit_features.each { |unit_feature| unit_feature.destroy }
    end
    respond_to do |format|
      format.html { redirect_to admin_unit_features_url }
      format.json { head :no_content }
    end

  end

end
