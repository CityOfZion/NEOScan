defmodule NeoscanWeb.TransactionsView do
  use NeoscanWeb, :view
  alias NeoscanMonitor.Api
  alias Neoscan.Helpers

  def get_class(type) do
    cond do
      type == "ContractTransaction" ->
        'neo-transaction'
      type == "ClaimTransaction" ->
        'gas-transaction'
      type == "IssueTransaction" ->
        'issue-transaction'
      type == "RegisterTransaction" ->
        'register-transaction'
      type == "InvocationTransaction" ->
        'invocation-transaction'
      type == "PublishTransaction" ->
        'publish-transaction'
      type == "MinerTransaction" ->
        'miner-transaction'
    end
  end

  def get_current_min_qtd(page) do
    %{:total_transactions => total} = Api.get_stats
    if total < 15 do
      0
    else
      (String.to_integer(page) - 1) * 15 + 1
    end
  end

  def get_current_max_qtd(page) do
    %{:total_transactions => total} = Api.get_stats
    cond do
      total < 15 ->
        total
      String.to_integer(page) * 15 > total ->
        total
      true ->
        String.to_integer(page) * 15
    end
  end

  def get_previous_page(conn, page) do
    int = page
          |> String.to_integer

    num = int - 1
          |> Integer.to_string

    raw(
      '<a href="#{
        transactions_path(conn, :go_to_page, num)
      }" class="button btn btn-primary"><i class="fa fa-angle-left"></i></a>'
    )
  end

  def get_next_page(conn, page) do
    int = page
          |> String.to_integer

    num = int + 1
          |> Integer.to_string

    raw(
      '<a href="#{
        transactions_path(conn, :go_to_page, num)
      }" class="button btn btn-primary"><i class="fa fa-angle-right"></i></a>'
    )
  end

  def check_last(page) do
    %{:total_transactions => total} = Api.get_stats

    int = page
          |> String.to_integer

    if int * 15 < total do
      true
    else
      false
    end
  end

  def get_total  do
    %{:total_transactions => total} = Api.get_stats
    total
  end

end
