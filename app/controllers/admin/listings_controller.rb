class Admin::ListingsController < Admin::BaseController
  def index
    @search = Listing.where(:user_id => @current_user.id, :state => 'show').search(params[:q])
    @listings = @search.result.paginate(:page => params[:page], :per_page => 10)
  end
end
