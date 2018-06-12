defmodule NeoscanCache.Cache do
  @moduledoc """
  GenServer module responsable to store blocks, states, trasactions and assets,
  Common interface to handle it is NeoscanCache.Api module(look there for more info)
  """

  use GenServer
  alias Neoscan.Blocks
  alias Neoscan.Transactions
  alias Neoscan.Transfers
  alias Neoscan.Addresses
  alias Neoscan.Stats

  alias Neoprice.NeoBtc
  alias Neoprice.NeoUsd
  alias Neoprice.GasBtc
  alias Neoprice.GasUsd
  alias NeoscanCache.EtsProcess

  @update_interval 5_000

  require Logger

  # starts the genserver
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  # run initial queries and fill state with all info needed in the app,
  # then sends message with new state to server module
  def init(:ok) do
    EtsProcess.create_table(__MODULE__)
    Process.send_after(self(), :broadcast, 30_000)
    {:ok, sync(%{tokens: []})}
  end

  def set(key, value) do
    :ets.insert(__MODULE__, {key, value})
  end

  def get(key) do
    try do
      :ets.lookup(__MODULE__, key)
    rescue
      ArgumentError ->
        Logger.warn("ETS is not initialized")
        nil
    else
      [{^key, result}] ->
        result

      _ ->
        nil
    end
  end

  def handle_info(:broadcast, state) do
    {blocks, _} =
      get(:blocks)
      |> Enum.split(5)

    {transactions, _} =
      get(:transactions)
      |> Enum.split(5)

    {transfers, _} =
      get(:transfers)
      |> Enum.split(5)

    payload = %{
      "blocks" => blocks,
      "transactions" => transactions,
      "transfers" => transfers,
      "price" => get(:price),
      "stats" => get(:stats)
    }

    if function_exported?(NeoscanWeb.Endpoint, :broadcast, 3) do
      apply(NeoscanWeb.Endpoint, :broadcast, ["room:home", "change", payload])
    end

    # In 10 seconds
    Process.send_after(self(), :broadcast, 1_000)
    {:noreply, state}
  end

  #  # repair blocks on startup
  #  def handle_info(:repair, state) do
  #    Unclaimed.repair_blocks()
  #    {:noreply, state}
  #  end

  def handle_info(:sync, state) do
    {:noreply, sync(state)}
  end

  # handles misterious messages received by unknown caller
  def handle_info({_ref, {:ok, _port, _pid}}, state) do
    {:noreply, state}
  end

  def get_general_stats do
    %{
      :total_blocks => Stats.count_blocks(),
      :total_transactions => Stats.count_transactions(),
      :total_transfers => Stats.count_transfers(),
      :total_addresses => Stats.count_addresses()
    }
  end

  # update nodes and stats information
  def sync(_) do
    Process.send_after(self(), :sync, @update_interval)
    blocks = Blocks.home_blocks()

    transactions = Transactions.home_transactions()

    transfers = Transfers.home_transfers()

    # Assets.list_assets()
    assets = []

    stats = get_general_stats()

    addresses = Addresses.list_latest()

    price = %{
      neo: %{
        btc: NeoBtc.last_price_full(),
        usd: NeoUsd.last_price_full()
      },
      gas: %{
        btc: GasBtc.last_price_full(),
        usd: GasUsd.last_price_full()
      }
    }

    tokens = []

    set(:blocks, blocks)
    set(:transactions, transactions)
    set(:transfers, transfers)
    set(:assets, assets)
    set(:stats, stats)
    set(:addresses, addresses)
    set(:price, price)

    %{
      :blocks => blocks,
      :transactions => transactions,
      :transfers => transfers,
      :assets => assets,
      :stats => stats,
      :addresses => addresses,
      :price => price,
      :tokens => tokens
    }
  end
end
