require 'test_helper'

class SignInTokensControllerTest < ActionController::TestCase
  setup do
    @sign_in_token = sign_in_tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sign_in_tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sign_in_token" do
    assert_difference('SignInToken.count') do
      post :create, sign_in_token: { text: @sign_in_token.text }
    end

    assert_redirected_to sign_in_token_path(assigns(:sign_in_token))
  end

  test "should show sign_in_token" do
    get :show, id: @sign_in_token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sign_in_token
    assert_response :success
  end

  test "should update sign_in_token" do
    patch :update, id: @sign_in_token, sign_in_token: { text: @sign_in_token.text }
    assert_redirected_to sign_in_token_path(assigns(:sign_in_token))
  end

  test "should destroy sign_in_token" do
    assert_difference('SignInToken.count', -1) do
      delete :destroy, id: @sign_in_token
    end

    assert_redirected_to sign_in_tokens_path
  end
end
