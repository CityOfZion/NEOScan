defmodule NeoscanNode.Blockchain do
  @moduledoc """
  The boundary for the Blockchain requests.
  """

  alias NeoscanNode.HttpCalls
  alias NeoscanNode.NodeChecker

  defp parse16("0x" <> rest), do: parse16(rest)

  defp parse16(string) do
    string
    |> String.upcase()
    |> Base.decode16!()
  end

  defp parse64(string), do: Base.decode64!(string, padding: false)

  defp parse_asset_type("GoverningToken"), do: :governing_token
  defp parse_asset_type("UtilityToken"), do: :utility_token

  defp parse_transaction_type("RegisterTransaction"), do: :register_transaction
  defp parse_transaction_type("IssueTransaction"), do: :issue_transaction
  defp parse_transaction_type("MinerTransaction"), do: :miner_transaction
  defp parse_transaction_type("ContractTransaction"), do: :contract_transaction
  defp parse_transaction_type("ClaimTransaction"), do: :claim_transaction
  defp parse_transaction_type("InvocationTransaction"), do: :invocation_transaction

  defp parse_float(string), do: elem(Float.parse(string), 0)
  defp parse_integer(nil), do: nil
  defp parse_integer(string), do: String.to_integer(string)

  defp parse_vin(vin) do
    %{
      transaction_hash: parse16(vin["txid"]),
      vout_index: vin["vout"]
    }
  end

  defp parse_vout(vout) do
    %{
      address: parse64(vout["address"]),
      asset: parse16(vout["asset"]),
      n: vout["n"],
      value: parse_float(vout["value"])
    }
  end

  defp parse_transaction_asset(nil, _), do: nil

  defp parse_transaction_asset(asset, transaction) do
    asset
    |> Map.merge(%{"id" => transaction["txid"], "issuer" => asset["admin"]})
    |> parse_asset()
  end

  defp parse_contract(contract) do
    %{
      author: contract["author"],
      code_version: contract["code_version"],
      email: contract["email"],
      hash: parse16(contract["hash"]),
      name: contract["name"],
      parameters: contract["parameters"],
      properties: contract["properties"],
      return_type: contract["returntype"],
      script: parse16(contract["script"]),
      version: contract["version"]
    }
  end

  defp parse_asset(asset) do
    %{
      admin: parse64(asset["admin"]),
      amount: parse_integer(asset["amount"]),
      available: parse_integer(asset["available"]),
      expiration: asset["expiration"],
      frozen: asset["frozen"],
      transaction_hash: parse16(asset["id"]),
      issuer: parse64(asset["issuer"]),
      name: asset["name"],
      owner: asset["owner"],
      precision: asset["precision"],
      type: parse_asset_type(asset["type"]),
      version: asset["version"]
    }
  end

  defp parse_block(block) do
    %{
      confirmations: block["confirmations"],
      hash: parse16(block["hash"]),
      index: block["index"],
      merkle_root: parse16(block["merkleroot"]),
      next_block_hash: parse16(block["nextblockhash"]),
      previous_block_hash: parse16(block["previousblockhash"]),
      next_consensus: parse64(block["nextconsensus"]),
      nonce: parse16(block["nonce"]),
      script: block["script"],
      size: block["size"],
      time: DateTime.from_unix!(block["time"]),
      tx: Enum.map(block["tx"], &parse_block_transaction(&1, block))
    }
  end

  defp parse_block_transaction(transaction, block) do
    transaction
    |> Map.merge(%{"blockhash" => block["hash"], "blocktime" => block["time"]})
    |> parse_transaction()
  end

  defp parse_transaction(transaction) do
    %{
      asset: parse_transaction_asset(transaction["asset"], transaction),
      attributes: transaction["attributes"],
      nonce: transaction["nonce"],
      scripts: transaction["scripts"],
      block_time: DateTime.from_unix!(transaction["blocktime"]),
      block_hash: parse16(transaction["blockhash"]),
      size: transaction["size"],
      sys_fee: parse_float(transaction["sys_fee"]),
      net_fee: parse_float(transaction["net_fee"]),
      hash: parse16(transaction["txid"]),
      type: parse_transaction_type(transaction["type"]),
      version: transaction["version"],
      vin: Enum.map(transaction["vin"], &parse_vin/1),
      vout: Enum.map(transaction["vout"], &parse_vout/1)
    }
  end

  @doc """
   Get the current block by height through seed 'index'
  """
  def get_block_by_height(height), do: get_block_by_height(NodeChecker.get_random_node(), height)

  def get_block_by_height(url, height) do
    {:ok, response} = HttpCalls.post(url, "getblock", [height, 1])
    {:ok, parse_block(response)}
  end

  def get_block_by_hash(hash), do: get_block_by_hash(NodeChecker.get_random_node(), hash)

  def get_block_by_hash(url, hash) do
    {:ok, response} = HttpCalls.post(url, "getblock", [hash, 1])
    {:ok, parse_block(response)}
  end

  def get_current_height, do: get_current_height(NodeChecker.get_random_node())

  def get_current_height(url), do: HttpCalls.post(url, "getblockcount", [])

  def get_transaction(txid), do: get_transaction(NodeChecker.get_random_node(), txid)

  def get_transaction(url, txid) do
    {:ok, response} = HttpCalls.post(url, "getrawtransaction", [txid, 1])
    {:ok, parse_transaction(response)}
  end

  def get_asset(txid), do: get_asset(NodeChecker.get_random_node(), txid)

  def get_asset(url, txid) do
    {:ok, response} = HttpCalls.post(url, "getassetstate", [txid, 1])
    {:ok, parse_asset(response)}
  end

  def get_contract(hash), do: get_contract(NodeChecker.get_random_node(), hash)

  def get_contract(url, hash) do
    {:ok, response} = HttpCalls.post(url, "getcontractstate", [hash])
    {:ok, parse_contract(response)}
  end
end