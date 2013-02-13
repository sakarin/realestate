class Account::ContactController < Account::BaseController

  before_filter :load_user

  def index
    render :edit
  end


  def update
    respond_to do |format|
      if  @user.update_without_password(params[:user])
        format.html { redirect_to account_contact_index_path, notice: t('admin.users.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def load_user
    @user = current_user
  end



end
