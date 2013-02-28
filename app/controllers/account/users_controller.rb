class Account::UsersController < Account::BaseController


  def index
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to account_users_path, notice: t('account.users.updated') }
        format.json { head :no_content }
      else
        format.html { redirect_to account_users_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
