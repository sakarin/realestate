class Account::InboxController < Account::BaseController
  def index
    @listings = current_user.listings
    @comments = Comment.find_all_comments('Listing', current_user.listing_ids, params['read'].nil? ?  'unread' : 'read')

  end


  def show
    @comment = Comment.find(params['id'])
    @comment.read
  end

  def multi_keep

      unless params[:comment_ids].nil?
        if params['commit'] == t('buttons.keep')
          @comments = Comment.find(params[:comment_ids])
          @comments.each { |comment| comment.read }
        else
          @comments = Comment.find(params[:comment_ids])
          @comments.each { |comment| comment.destroy }
        end
      end
    respond_to do |format|
      format.html { redirect_to account_inbox_index_path }
      format.json { head :no_content }
    end
  end

end
