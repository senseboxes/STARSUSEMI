require 'test_helper'

class CscentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cscenter = cscenters(:one)
  end

  test "should get index" do
    get cscenters_url
    assert_response :success
  end

  test "should get new" do
    get new_cscenter_url
    assert_response :success
  end

  test "should create cscenter" do
    assert_difference('Cscenter.count') do
      post cscenters_url, params: { cscenter: { content: @cscenter.content, title: @cscenter.title, user_id: @cscenter.user_id } }
    end

    assert_redirected_to cscenter_url(Cscenter.last)
  end

  test "should show cscenter" do
    get cscenter_url(@cscenter)
    assert_response :success
  end

  test "should get edit" do
    get edit_cscenter_url(@cscenter)
    assert_response :success
  end

  test "should update cscenter" do
    patch cscenter_url(@cscenter), params: { cscenter: { content: @cscenter.content, title: @cscenter.title, user_id: @cscenter.user_id } }
    assert_redirected_to cscenter_url(@cscenter)
  end

  test "should destroy cscenter" do
    assert_difference('Cscenter.count', -1) do
      delete cscenter_url(@cscenter)
    end

    assert_redirected_to cscenters_url
  end
end
