require 'test_helper'

class Admin::ExpertsControllerTest < ActionController::TestCase
  setup do
    @admin_expert = admin_experts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_experts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_expert" do
    assert_difference('Admin::Expert.count') do
      post :create, admin_expert: { name: @admin_expert.name }
    end

    assert_redirected_to admin_expert_path(assigns(:admin_expert))
  end

  test "should show admin_expert" do
    get :show, id: @admin_expert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_expert
    assert_response :success
  end

  test "should update admin_expert" do
    put :update, id: @admin_expert, admin_expert: { name: @admin_expert.name }
    assert_redirected_to admin_expert_path(assigns(:admin_expert))
  end

  test "should destroy admin_expert" do
    assert_difference('Admin::Expert.count', -1) do
      delete :destroy, id: @admin_expert
    end

    assert_redirected_to admin_experts_path
  end
end
