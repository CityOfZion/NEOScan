defmodule Neoprice.Cryptocompare.ApiTest do
  @moduledoc "tests on the API"
  use ExUnit.Case
  alias Neoprice.Cryptocompare.Api

  test "minute report" do
    now = DateTime.utc_now |> DateTime.to_unix()
    prices = Api.get_historical_price(:minute,  "NEO", "BTC", 100, 1, now)
    assert_in_delta List.last(prices) |> elem(0), now, 60
  end

  test "hour report" do
    now = DateTime.utc_now |> DateTime.to_unix()
    prices = Api.get_historical_price(:hour, "NEO", "BTC", 100, 1, now)
    assert_in_delta List.last(prices) |> elem(0), now, 3600
  end

  test "day report" do
    now = DateTime.utc_now |> DateTime.to_unix()
    prices = Api.get_historical_price(:hour, "NEO", "BTC", 100, 1, now)
    assert_in_delta List.last(prices) |> elem(0), now, 24*3600
  end

  test "last" do
    assert Api.last_price("NEO", "BTC") != nil
  end
end
