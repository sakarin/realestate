class SessionsController < Devise::SessionsController

  layout 'account'

  def new
   super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

end