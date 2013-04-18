require 'spec_helper'

describe "admin unit features", :js => false do

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

  it "should can edit unit feature" do
    @unit_feature = FactoryGirl.create(:unit_feature)

    visit admin_unit_features_path
    click_link "feature1"
    fill_in "unit_feature_name", :with => "feature_test_edit"
    click_button I18n.t('helpers.submit.update', :model => I18n.t('activerecord.models.unit_feature'))

    page.should have_content(t('admin.unit_features.updated'))
  end

  it "should can delete unit feature" do
    @unit_feature = FactoryGirl.create(:unit_feature)
    visit admin_unit_features_path

    within('#unit_feature_1') do
      find('a.delete').click
    end

    if page.mode == :selenium
      alert = page.driver.browser.switch_to.alert
      alert.accept
    end

    page.should_not have_content('feature1')
  end


end

