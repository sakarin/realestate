require 'test_helper'

class PostGroupsControllerTest < ActionController::TestCase
  setup do
    @post_group = post_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_group" do
    assert_difference('PostGroup.count') do
      post :create, post_group: { description: @post_group.description, name: @post_group.name, parent: @post_group.parent, slug: @post_group.slug }
    end

    assert_redirected_to post_group_path(assigns(:post_group))
  end

  test "should show post_group" do
    get :show, id: @post_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_group
    assert_response :success
  end

  test "should update post_group" do
    put :update, id: @post_group, post_group: { description: @post_group.description, name: @post_group.name, parent: @post_group.parent, slug: @post_group.slug }
    assert_redirected_to post_group_path(assigns(:post_group))
  end

  test "should destroy post_group" do
    assert_difference('PostGroup.count', -1) do
      delete :destroy, id: @post_group
    end

    assert_redirected_to post_groups_path
  end
end
