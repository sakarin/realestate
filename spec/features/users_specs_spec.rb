require 'spec_helper'

describe "Users Specs", :js => false do
  describe "signup" do
    it "should not make a new user" do
      lambda do
        visit new_user_registration_path
        fill_in "user_email",        :with => ""
        fill_in "user_password",     :with => ""
        fill_in "user_password_confirmation", :with => ""

        click_button I18n.t('devise.button.registration')

        page.should have_selector('div .alert-error')
      end.should_not change(User, :count)
    end
  end

  describe "success" do
    it "should make a new user" do
      lambda do
        visit new_user_registration_path
        fill_in "user_email",        :with => "foobar@example.com"
        fill_in "user_password",     :with => "foobar"
        fill_in "user_password_confirmation", :with => "foobar"

        click_button I18n.t('devise.button.registration')

        page.should have_content(I18n.t('devise.user_registrations.user.signed_up_but_unconfirmed'))

      end.should change(User, :count).by(1)
    end
  end
end
