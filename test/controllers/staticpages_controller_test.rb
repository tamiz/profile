require 'test_helper'

class StaticpagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Ruby on rails sample app"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Ruby on rails sample app"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Ruby on rails sample app"
  end

  test  "should get contact" do
    get contact_path
    assert_response type :sucess
    assert_select "title", "Ruby on rails sample app"
  end

end
