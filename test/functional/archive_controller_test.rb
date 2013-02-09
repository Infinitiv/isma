require 'test_helper'

class ArchiveControllerTest < ActionController::TestCase
  test "should get articles" do
    get :articles
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get anounces" do
    get :anounces
    assert_response :success
  end

  test "should get all" do
    get :all
    assert_response :success
  end

end
