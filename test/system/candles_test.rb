require "application_system_test_case"

class CandlesTest < ApplicationSystemTestCase
  setup do
    @candle = candles(:one)
  end

  test "visiting the index" do
    visit candles_url
    assert_selector "h1", text: "Candles"
  end

  test "should create candle" do
    visit candles_url
    click_on "New candle"

    check "Lit" if @candle.lit
    fill_in "Name", with: @candle.name
    click_on "Create Candle"

    assert_text "Candle was successfully created"
    click_on "Back"
  end

  test "should update Candle" do
    visit candle_url(@candle)
    click_on "Edit this candle", match: :first

    check "Lit" if @candle.lit
    fill_in "Name", with: @candle.name
    click_on "Update Candle"

    assert_text "Candle was successfully updated"
    click_on "Back"
  end

  test "should destroy Candle" do
    visit candle_url(@candle)
    click_on "Destroy this candle", match: :first

    assert_text "Candle was successfully destroyed"
  end
end
