defmodule NEOScanSync.BlockSync do
  @moduledoc """

    External process to fetch blockchain from RCP node and sync the database

  """

  alias Neoscan.Blockchain
  alias Neoscan.Blocks
  alias Neoscan.Transactions

  @me __MODULE__

  #Starts the application
  def start_link() do
    Agent.start_link(fn -> start() end , name: @me)
  end

  #receives external orders to change the main seed, seed is the integer of the
  #corresponding seed, as defined in the Neoscan.Http module
  def change_seed(seed) do
    start(seed)
  end


  #check if main endpoint is alive, otherwise shutdown process
  def start(seed \\ 0) do
    alive = Process.whereis(Neoscan.Supervisor)
    |> Process.alive?
    case alive do
      true ->
        fetch_db(seed)
      false ->
        Process.exit(self(), :shutdown)
    end
  end

  #get highest block from db and route functions forward
  def fetch_db(seed) do
    case Blocks.get_highest_block_in_db() do
      nil ->
        get_block_by_height(seed, 1)
        |> add_block(seed)
      { :ok, %Blocks.Block{:index => count}} ->
        evaluate(seed, count)
      { :error, _reason} ->
        Process.exit(self(), :error)
    end
  end

  #Evaluates db against external blockchain and route required functions
  def evaluate(seed, count) do
    case Blockchain.get_current_height(seed) do
      {:ok, height} when height-2 > count  ->
        get_block_by_height( seed, count+1 )
        |> add_block(seed)
      {:ok, height} when height-2 == count  ->
        Process.sleep(15000)
        start(seed)
      {:ok, height} when height-2 < count ->
        Blocks.delete_higher_than(height-2)
        Process.sleep(15000)
        start(seed)
      { :error, :timeout} ->
        Process.sleep(5000)
        start(seed)
      { :error, _reason} ->
        Process.exit(self(), :error)
    end
  end

  #add block with transactions to the db
  def add_block(%{"tx" => transactions, "index" => n} = block, seed) do
    Map.put(block,"tx_count",Enum.count(transactions))
    |> Map.delete("tx")
    |> Blocks.create_block()
    |> Transactions.create_transactions(transactions)
    |> check(seed,n)
  end

  def check([_h | t], seed, n) do
    cond do
      {:ok, "Created"} == t or {:ok, "Deleted"} == t ->
        IO.puts("Block #{n} stored")
        start(seed)
      true ->
        Process.exit(self(), :error)
    end
  end


  #handles error when fetching highest block from db
  def get_block_by_height(seed, index) do
    case Blockchain.get_block_by_height(seed, index) do
      { :ok , block } ->
        block
      { :error, :timeout} ->
        Process.sleep(5000)
        start(seed)
      { :error, _reason} ->
        Process.exit(self(), :error)
    end
  end

end
