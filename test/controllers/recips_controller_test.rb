require 'test_helper'

class RecipsControllerTest < ActionController::TestCase
  setup do
    @recip = recips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recips)
  end

  test "should create recip" do
    assert_difference('Recip.count') do
      post :create, recip: {  }
    end

    assert_response 201
  end

  test "should show recip" do
    get :show, id: @recip
    assert_response :success
  end

  test "should update recip" do
    put :update, id: @recip, recip: {  }
    assert_response 204
  end

  test "should destroy recip" do
    assert_difference('Recip.count', -1) do
      delete :destroy, id: @recip
    end

    assert_response 204
  end
end
