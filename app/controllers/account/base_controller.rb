class Account::BaseController < ApplicationController
  before_filter :authenticate_user!
  layout 'account'



end
