require 'test_helper'

class CuesControllerTest < ActionController::TestCase
  setup do
    @cue = cues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cue" do
    assert_difference('Cue.count') do
      post :create, cue: { name: @cue.name }
    end

    assert_redirected_to cue_path(assigns(:cue))
  end

  test "should show cue" do
    get :show, id: @cue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cue
    assert_response :success
  end

  test "should update cue" do
    put :update, id: @cue, cue: { name: @cue.name }
    assert_redirected_to cue_path(assigns(:cue))
  end

  test "should destroy cue" do
    assert_difference('Cue.count', -1) do
      delete :destroy, id: @cue
    end

    assert_redirected_to cues_path
  end
end
