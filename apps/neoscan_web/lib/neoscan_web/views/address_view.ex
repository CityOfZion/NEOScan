defmodule NeoscanWeb.AddressView do
  use NeoscanWeb, :view
  alias NeoscanMonitor.Api
  alias Neoscan.Helpers

  def get_NEO_balance(nil) do
    0
  end
  def get_NEO_balance(balance) do
    balance
    |> Map.to_list
    |> Enum.filter(
         fn {_asset, %{"asset" => asset}} ->
           Api.get_asset_name(asset) == "NEO"
         end
       )
    |> Enum.reduce(0, fn ({_asset, %{"amount" => amount}}, _acc) -> amount end)
    |> Helpers.round_or_not
  end

  def get_GAS_balance(nil) do
    raw('<p class="balance-amount">0<span>#{0}</span></p>')
  end
  def get_GAS_balance(balance) do
    {int, div} = balance
                 |> Map.to_list
                 |> Enum.filter(
                      fn {_asset, %{"asset" => asset}} ->
                        Api.get_asset_name(asset) == "GAS"
                      end
                    )
                 |> Enum.reduce(
                      0.0,
                      fn ({_asset, %{"amount" => amount}}, acc) ->
                        amount + acc
                      end
                    )
                 |> Float.round(8)
                 |> Float.to_string
                 |> Integer.parse

    raw('<p class="balance-amount">#{int}<span>#{div}</span></p>')
  end

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

  def get_current_min_qtd(page, total) do
    if total < 15 do
      0
    else
      (String.to_integer(page) - 1) * 15 + 1
    end
  end

  def get_current_max_qtd(page, total) do
    if total < 15 do
      total
    else
      if String.to_integer(page) * 15 > total do
        total
      else
        String.to_integer(page) * 15
      end
    end
  end

  def get_previous_page(conn, address, page) do
    int = page
          |> String.to_integer

    num = int - 1
          |> Integer.to_string

    raw(
      '<a href="#{
        address_path(conn, :go_to_page, address, num)
      }" class="button btn btn-primary"><i class="fa fa-angle-left"></i></a>'
    )
  end

  def get_next_page(conn, address, page) do
    int = page
          |> String.to_integer

    num = int + 1
          |> Integer.to_string

    raw(
      '<a href="#{
        address_path(conn, :go_to_page, address, num)
      }" class="button btn btn-primary"><i class="fa fa-angle-right"></i></a>'
    )
  end

  def check_last(page, total) do
    int = page
          |> String.to_integer

    if int * 15 < total do
      true
    else
      false
    end
  end

end
