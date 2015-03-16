require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest


  test "layout links" do

    get root_path
    assert_template 'static_pages/home'    
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    get signup_path
    assert_select "title", full_title("Sign up")


  end

  test 'signup' do
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | rails tutorial"
  end

  test 'login and logout links when logging in' do
    @user = users(:joe)

    get root_path
    assert_select "a[href=?]", login_path
    
    log_in_as @user
    get user_path @user
    assert_select "a[href=?]", logout_path
  end

end
