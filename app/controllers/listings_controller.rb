class ListingsController < ApplicationController
  #before_filter :find_resource, only: [:index, :show, :edit, :update, :destroy]

  def index
    @listings = nil
    @search = Listing.search(params[:q])
  end

  def show
    @listing = Listing.find(params['id'])
    @commentable = @listing
    @comment = Comment.new
  end

  def edit
    @search = Listing.search(params[:q])
  end

  def search
    index

    @search = Listing.show.search(params[:q])
    @listings = @search.result.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')

    render :search
  end

  def dynamic_amphurs
    @amphurs = Amphur.find_all_by_province_id(params[:province_id])
    respond_to do |format|
      format.js
    end
  end


  #protected
  #
  #def find_resource
  #  @listing = Listing.find_by_permalink!(params[:id])
  #end
end
