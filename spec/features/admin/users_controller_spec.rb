require 'spec_helper'

describe "user", :js => false do

  before (:each) do
    @user = FactoryGirl.create(:user)
    @user.roles << Role.find_or_create_by_name("admin")
    @user.save
    login_as(@user, :scope => :user, :run_callbacks => false)

  end

  describe "index" do
    it "should can sign in to admin section" do
      visit ('/admin/users')

      page.should have_content('example@example.com')


    end
  end


end
