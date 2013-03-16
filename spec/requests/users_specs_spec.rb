require 'spec_helper'

describe "Users" do
  describe "signup" do
    it "should not make a new user" do
      lambda do
        visit new_user_registration_path
        fill_in "Email",        :with => ""
        fill_in "Password",     :with => ""
        fill_in "user_password_confirmation", :with => ""
        click_button
        response.should render_template('devise/registrations/new')
        response.should have_selector('div .alert-error')
      end.should_not change(User, :count)
    end
  end

  describe "success" do
    it "should make a new user" do
      lambda do
        visit new_user_registration_path
        fill_in "Email",        :with => "foobar@example.com"
        fill_in "Password",     :with => "foobar"
        fill_in "user_password_confirmation", :with => "foobar"
        click_button
        response.should render_template('sessions/new')
        response.should have_selector('div.flash_notice', :content => t(devise.user_registrations.user.signed_up_but_unconfirmed))

      end.should change(User, :count).by(1)
    end
  end
end
