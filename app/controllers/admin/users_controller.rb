class Admin::UsersController < Admin::BaseController

  before_filter :load_roles, :only => [:edit, :new, :update, :create]

  def index
    @search = User.search(params[:q])
    @users = @search.result.paginate(:page => params[:page], :per_page => 15)
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_users_path, notice: t('admin.users.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end




  private

  #def sign_in_if_change_own_password
  #  if current_user == @user && @user.password.present?
  #    sign_in(@user, :event => :authentication, :bypass => true)
  #  end
  #end

  def load_roles
    @roles = Role.scoped
  end

end
