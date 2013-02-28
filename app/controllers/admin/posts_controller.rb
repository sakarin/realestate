class Admin::PostsController <  Admin::BaseController

  def index
    @search = Post.search(params[:q])
    @posts = @search.result.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.json  { render :json => @posts }
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_path, notice: t('admin.posts.created') }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_posts_path, notice: t('admin.posts.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end
  end

  def multi_destroy
    unless params[:post_ids].nil?
      @posts = Post.find(params[:post_ids])
      @posts.each { |post| post.destroy }
    end
    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end

  end

end
