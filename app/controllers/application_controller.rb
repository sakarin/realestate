class ApplicationController < ActionController::Base
  protect_from_forgery

  # Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end

  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    #redirect_to :back, :alert => exception.message

    begin
      redirect_to :back, :alert => exception.message
    rescue
      redirect_to root_path, :alert => exception.message
    end
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    if current_user.has_role? :admin
      admin_users_url
    else
      account_listings_path
    end

    #redirect_to :back
  end


end
