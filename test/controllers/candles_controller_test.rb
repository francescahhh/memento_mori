require "test_helper"

class CandlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candle = candles(:one)
  end

  test "should get index" do
    get candles_url
    assert_response :success
  end

  test "should get new" do
    get new_candle_url
    assert_response :success
  end

  test "should create candle" do
    assert_difference("Candle.count") do
      post candles_url, params: { candle: { lit: @candle.lit, name: @candle.name } }
    end

    assert_redirected_to candle_url(Candle.last)
  end

  test "should show candle" do
    get candle_url(@candle)
    assert_response :success
  end

  test "should get edit" do
    get edit_candle_url(@candle)
    assert_response :success
  end

  test "should update candle" do
    patch candle_url(@candle), params: { candle: { lit: @candle.lit, name: @candle.name } }
    assert_redirected_to candle_url(@candle)
  end

  test "should destroy candle" do
    assert_difference("Candle.count", -1) do
      delete candle_url(@candle)
    end

    assert_redirected_to candles_url
  end
end
