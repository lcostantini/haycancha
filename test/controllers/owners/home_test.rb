require 'test_helper'

class Owners::HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @owner = Owner.create({email: 'qwe@qwe.com', password: 'password'})
  end

  test 'when owner sign in should get home welcome' do
    sign_in :owner, @owner
    get :welcome
    assert_response :success
  end

  test 'when owner not logged in redirect to welcome' do
    get :welcome
    assert_redirected_to  new_owner_session_path
  end

end