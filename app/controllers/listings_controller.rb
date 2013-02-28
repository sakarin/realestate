class ListingsController < ApplicationController
  #before_filter :find_resource, only: [:index, :show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params['id'])
    @commentable = @listing
    @comment = Comment.new

  end


  #protected
  #
  #def find_resource
  #  @listing = Listing.find_by_permalink!(params[:id])
  #end
end
