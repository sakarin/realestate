class UserRegistrationsController  < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, :only => [:edit, :edit_detail, :profile, :notification, :update, :destroy]
  layout 'account'
  #helper 'navigation'
  #helper 'form'

  def new
    super
  end


  def create
    super
  end

  def edit
    super
  end


  def update

    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    password_changed = !params[:user][:password].blank?
    current_password = !params[:user][:current_password].blank?

    successfully_updated = if email_changed or password_changed
                             @user.update_with_password(params[:user])
                           elsif !(email_changed or password_changed  or current_password)
                             params[:user].delete(:current_password)
                             @user.update_without_password(params[:user])
                           else
                              false
                           end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      #redirect_to root_path
      render "edit"
    else
      render "edit"
    end

  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :facebook, :all






end
