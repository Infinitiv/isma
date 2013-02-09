require 'test_helper'

class DivisionTypesControllerTest < ActionController::TestCase
  setup do
    @division_type = division_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:division_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create division_type" do
    assert_difference('DivisionType.count') do
      post :create, division_type: { name: @division_type.name }
    end

    assert_redirected_to division_type_path(assigns(:division_type))
  end

  test "should show division_type" do
    get :show, id: @division_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @division_type
    assert_response :success
  end

  test "should update division_type" do
    put :update, id: @division_type, division_type: { name: @division_type.name }
    assert_redirected_to division_type_path(assigns(:division_type))
  end

  test "should destroy division_type" do
    assert_difference('DivisionType.count', -1) do
      delete :destroy, id: @division_type
    end

    assert_redirected_to division_types_path
  end
end
