require 'test_helper'

class PopulartiesControllerTest < ActionController::TestCase
  setup do
    @popularty = popularties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:popularties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create popularty" do
    assert_difference('Popularty.count') do
      post :create, popularty: {  }
    end

    assert_redirected_to popularty_path(assigns(:popularty))
  end

  test "should show popularty" do
    get :show, id: @popularty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @popularty
    assert_response :success
  end

  test "should update popularty" do
    put :update, id: @popularty, popularty: {  }
    assert_redirected_to popularty_path(assigns(:popularty))
  end

  test "should destroy popularty" do
    assert_difference('Popularty.count', -1) do
      delete :destroy, id: @popularty
    end

    assert_redirected_to popularties_path
  end
end
