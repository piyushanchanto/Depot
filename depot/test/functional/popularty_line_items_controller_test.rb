require 'test_helper'

class PopulartyLineItemsControllerTest < ActionController::TestCase
  setup do
    @popularty_line_item = popularty_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:popularty_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create popularty_line_item" do
    assert_difference('PopulartyLineItem.count') do
      post :create, popularty_line_item: { popularty_id: @popularty_line_item.popularty_id, product_id: @popularty_line_item.product_id }
    end

    assert_redirected_to popularty_line_item_path(assigns(:popularty_line_item))
  end

  test "should show popularty_line_item" do
    get :show, id: @popularty_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @popularty_line_item
    assert_response :success
  end

  test "should update popularty_line_item" do
    put :update, id: @popularty_line_item, popularty_line_item: { popularty_id: @popularty_line_item.popularty_id, product_id: @popularty_line_item.product_id }
    assert_redirected_to popularty_line_item_path(assigns(:popularty_line_item))
  end

  test "should destroy popularty_line_item" do
    assert_difference('PopulartyLineItem.count', -1) do
      delete :destroy, id: @popularty_line_item
    end

    assert_redirected_to popularty_line_items_path
  end
end
