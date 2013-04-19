class Account::ListingsController < Account::BaseController
  load_and_authorize_resource

  before_filter :clear_session, :only => [:index, :draft, :history, :exclusive]

  def index
    @search = Listing.where(:user_id => @current_user.id, :state => 'show').search(params[:q])
    @listings = @search.result.paginate(:page => params[:page], :per_page => 10)
  end

  def draft
    @search = Listing.where(:user_id => @current_user.id, :state => 'draft').search(params[:q])
    @listings = @search.result.paginate(:page => params[:page], :per_page => 10)
  end

  def history
    @search = Listing.where(:user_id => @current_user.id, :state => 'history').search(params[:q])
    @listings = @search.result.paginate(:page => params[:page], :per_page => 10)
  end

  def exclusive
    @search = Listing.where(:user_id => @current_user.id, :state => 'exclusive').search(params[:q])
    @listings = @search.result.paginate(:page => params[:page], :per_page => 10)
  end


  def new
    session[:listing_params] ||= {}
    @listing = Listing.new(session[:listing_params])
    @listing.current_step = session[:listing_step]
  end

  def create
    session[:listing_params].deep_merge!(params[:listing]) if params[:listing]
    @listing = Listing.new(session[:listing_params])
    @listing.current_step = session[:listing_step]
    @listing.user = current_user

    if @listing.valid?
      @listing.save
      @listing.next_step
      session[:listing_step] = @listing.current_step

      if params[:save_button]

        redirect_to account_listings_path
      else

        redirect_to edit_account_listing_path(@listing)
      end
    else
      render :action => "new"
    end
  end

  def edit
    session[:listing_params] ||= {}
    @listing = Listing.find(params[:id])
    @listing.current_step = session[:listing_step]

  end

  def update
    session[:listing_params].deep_merge!(params[:listing]) if params[:listing]
    @listing = Listing.find(params[:id])
    @listing.current_step = session[:listing_step]

    if @listing.valid?
      if params[:back_button]
        @listing.previous_step
        session[:listing_step] = @listing.current_step
        redirect_to edit_account_listing_path(@listing)
      elsif @listing.last_step?
        @listing.update_attributes(session[:listing_params]) if @listing.all_valid?

        session[:listing_step] = session[:listing_params] = nil
        redirect_to account_listings_path
      elsif params[:save_button]
        @listing.update_attributes(session[:listing_params])
        session[:listing_step] = @listing.current_step
        redirect_to account_listings_path
      elsif params[:ok_button]
        @listing.complete
        redirect_to account_listings_path
      else
        @listing.next_step
        session[:listing_step] = @listing.current_step
        redirect_to edit_account_listing_path(@listing)
      end

    else
      render "edit"
    end



  end

  def progress_trackers

    session[:listing_step] = params[:step]

    unless params[:id].nil?
      @listing = Listing.find(params[:id])
      redirect_to edit_account_listing_path(@listing)
    else
      redirect_to new_account_listing_path
    end

  end


  def dynamic_amphurs

    @amphurs = Amphur.find_all_by_province_id(params[:province_id])
    respond_to do |format|
      format.js
    end
  end

  def dynamic_districts
    @districts = District.find_all_by_amphur_id(params[:amphur_id])
    respond_to do |format|
      format.js
    end
  end

  private

  def clear_session
    session[:listing_params] = nil
    session[:listing_step] = nil

  end


end