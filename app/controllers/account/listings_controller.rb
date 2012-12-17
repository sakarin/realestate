class Account::ListingsController < Account::BaseController

  def index

    @search = Listing.search(params[:q])
    @listings = @search.result.paginate(:page => params[:page], :per_page => 10)
    session[:listing_params] = nil
    session[:listing_step] = nil

    @images = Image.find_all_by_session_id(session[:session_id])
    @images.each do |image|
      image.update_attributes(:session_id => "")
    end

  end

  def new
    session[:listing_params] ||= {}
    @listing = Listing.new(session[:listing_params])
    @listing.current_step = session[:listing_step]
    @images = Image.find_all_by_session_id(session[:session_id])
  end

  def create
    session[:listing_params].deep_merge!(params[:listing]) if params[:listing]
    @listing = Listing.new(session[:listing_params])
    @listing.current_step = session[:listing_step]

    if @listing.valid?
      if params[:back_button]
        @listing.previous_step
      elsif @listing.last_step?
        @listing.save if @listing.all_valid?
      elsif params[:save_button]
        @listing.save
        unless @listing.id.nil?
          @images = Image.find_all_by_session_id(session[:session_id])
          @images.each do |image|
            image.update_attributes(:listing_id => @listing.id, :session_id => "")
          end
        end
      else
        #@listing.save
        @listing.next_step
      end
      session[:listing_step] = @listing.current_step
    end

    if @listing.new_record?
      redirect_to new_account_listing_path
    else

      session[:listing_step] = session[:listing_params] = nil
      flash[:notice] = "Listing saved!"
      redirect_to account_listings_path
    end

  end

  def edit
    session[:listing_params] ||= {}
    @listing = Listing.find(params[:id])
    @listing.current_step = session[:listing_step]
    @images = @listing.images
  end


  def update

    session[:listing_params].deep_merge!(params[:listing]) if params[:listing]
    @listing = Listing.find(params[:id])
    @listing.current_step = session[:listing_step]

    if @listing.valid?
      if params[:back_button]
        @listing.previous_step
      elsif @listing.last_step?
        @listing.update_attributes(session[:listing_params]) if @listing.all_valid?
      elsif params[:save_button]
        @listing.update_attributes(session[:listing_params])
      else
        @listing.next_step
      end
      session[:listing_step] = @listing.current_step
    end

    unless @listing.id.nil?
      @images = Image.find_all_by_session_id(session[:session_id])
      @images.each do |image|
        image.update_attributes(:listing_id => @listing.id, :session_id => "")
      end
    end

    unless params[:save_button]
      redirect_to edit_account_listing_path(@listing)
    else
      session[:listing_step] = session[:listing_params] = nil
      flash[:notice] = "Listing saved!"
      redirect_to account_listings_path
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
    @amphurs = Amphur.find_all_by_province_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def dynamic_districts
    @districts = District.find_all_by_amphur_id(params[:id])
    respond_to do |format|
      format.js
    end
  end


end
