require 'test_helper'

class FavLineItemsControllerTest < ActionController::TestCase
  setup do
    @fav_line_item = fav_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fav_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fav_line_item" do
    assert_difference('FavLineItem.count') do
      post :create, fav_line_item: { fav_id: @fav_line_item.fav_id, product_id: @fav_line_item.product_id }
    end

    assert_redirected_to fav_line_item_path(assigns(:fav_line_item))
  end

  test "should show fav_line_item" do
    get :show, id: @fav_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fav_line_item
    assert_response :success
  end

  test "should update fav_line_item" do
    put :update, id: @fav_line_item, fav_line_item: { fav_id: @fav_line_item.fav_id, product_id: @fav_line_item.product_id }
    assert_redirected_to fav_line_item_path(assigns(:fav_line_item))
  end

  test "should destroy fav_line_item" do
    assert_difference('FavLineItem.count', -1) do
      delete :destroy, id: @fav_line_item
    end

    assert_redirected_to fav_line_items_path
  end
end
