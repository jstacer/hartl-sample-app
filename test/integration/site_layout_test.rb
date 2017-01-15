require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	def setup
    	@user = users(:michael)
  	end

	test "layout links" do
	    get root_path
	    assert_template 'static_pages/home'
	    assert_select "a[href=?]", root_path, count: 2
	    assert_select "a[href=?]", help_path
	    assert_select "a[href=?]", about_path
	    assert_select "a[href=?]", contact_path
	    assert_select "a[href=?]", users_path, count: 0  # users_path should not appear yet
	    get contact_path
	    assert_select "title", full_title("Contact")
	    get signup_path
	    assert_select "title", full_title("Sign up")
	    assert_select "a[href=?]", login_path, count: 1  # since not yet logged in

	    # Logging in changes layout links
	    log_in_as(@user)
	    assert_redirected_to @user
	    get users_path
	    assert_template 'users/index'
	    assert_select "a[href=?]", login_path, count: 0
	    assert_select "a[href=?]", users_path
	    assert_select "a[href=?]", logout_path
	end

end
