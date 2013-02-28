class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @search = Comment.search(params[:q])
    @comments = @search.result.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.json  { render :json => @comments }
    end
  end

  def new
    @comment = @commentable.comments.new
  end

  #def edit
  #  @comment = Comment.find(params[:id])
  #end

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  #def update
  #  @comment = Comment.find(params[:id])
  #
  #  respond_to do |format|
  #    if @comment.update_attributes(params[:comment])
  #      format.html { redirect_to listing_comments_path, notice: t('admin.comments.updated') }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @comment.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to listing_comments_url }
      format.json { head :no_content }
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

 
end
