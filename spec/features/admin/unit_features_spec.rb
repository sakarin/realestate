require 'spec_helper'

describe "admin unit features", :js => true do

  before (:each) do
    @user = FactoryGirl.create(:user)
    @user.roles << Role.find_or_create_by_name("admin")
    @user.save
    login_as(@user, :scope => :user, :run_callbacks => false)
  end

  it "should can create unit feature" do
    visit admin_unit_features_path
    click_link(I18n.t('admin.unit_features.new'))
    fill_in "unit_feature_name", :with => "feature_test"
    click_button I18n.t('helpers.submit.create', :model => I18n.t('activerecord.models.unit_feature'))
    page.should have_content(I18n.t('admin.unit_features.created'))
  end


  it "should can edit unit feature" do
    @unit_feature = FactoryGirl.create(:unit_feature)
    visit edit_admin_unit_feature_path(@unit_feature)
    fill_in "unit_feature_name", :with => "feature_test_edit"
    click_button I18n.t('helpers.submit.update', :model => I18n.t('activerecord.models.unit_feature'))
    page.should have_content(I18n.t('admin.unit_features.updated'))
  end


end

