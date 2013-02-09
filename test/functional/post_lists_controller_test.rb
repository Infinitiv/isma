require 'test_helper'

class PostListsControllerTest < ActionController::TestCase
  setup do
    @post_list = post_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_list" do
    assert_difference('PostList.count') do
      post :create, post_list: { name: @post_list.name }
    end

    assert_redirected_to post_list_path(assigns(:post_list))
  end

  test "should show post_list" do
    get :show, id: @post_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_list
    assert_response :success
  end

  test "should update post_list" do
    put :update, id: @post_list, post_list: { name: @post_list.name }
    assert_redirected_to post_list_path(assigns(:post_list))
  end

  test "should destroy post_list" do
    assert_difference('PostList.count', -1) do
      delete :destroy, id: @post_list
    end

    assert_redirected_to post_lists_path
  end
end
