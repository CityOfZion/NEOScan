defmodule Neoscan.Api.ApiTest do
  use Neoscan.DataCase
  import Neoscan.Factory

  alias Neoscan.Api

  # @asset "c56f33fc6ecfcd0c225c4ab356fee59390af8560be0e930faebe74a6daff7c9b"

  test "get_balance/1" do
    address_history = insert(:address_history)

    assert not is_nil(Api.get_balance(address_history.address_hash).balance)
    assert is_nil(Api.get_balance("notexisting").balance)
  end

  test "get_unclaimed/1" do
    address_history = insert(:address_history)

    assert %{address: Base.encode16(address_history.address_hash), unclaimed: 0} ==
             Api.get_unclaimed(address_history.address_hash)

    assert %{address: "not found", unclaimed: 0} == Api.get_unclaimed("notexisting")
  end

  test "get_claimed/1" do
    #      address = insert(:address)
    #      expected_claim = [%{txids: List.first(address.claimed).txids}]

    #      assert %{address: address.address, claimed: expected_claim} ==
    #               Api.get_claimed(address.address)

    assert %{address: "not found", claimed: nil} == Api.get_claimed("notexisting")
  end

  test "get_claimable/1" do
    #      Application.put_env(:neoscan, :use_block_cache, true)
    #      for x <- 1..75, do: insert(:block, %{index: x, total_sys_fee: x})
    #
    #      address =
    #        insert(:address, %{
    #          vouts: [insert(:vout, %{asset: @asset, start_height: 25, end_height: 75})]
    #        })
    #
    #      assert %{
    #               address: _,
    #               claimable: [
    #                 %{
    #                   end_height: 75,
    #                   generated: 0.0002,
    #                   n: 0,
    #                   start_height: 25,
    #                   sys_fee: 0.0012375,
    #                   txid: _,
    #                   unclaimed: 0.0014375000000000002,
    #                   value: 50
    #                 }
    #               ],
    #               unclaimed: 0.0014375000000000002
    #             } = Api.get_claimable(address.address)

    assert %{address: "not found", claimable: nil} == Api.get_claimable("notexisting")
  end

  test "get_address/1" do
    # address = insert(:address)

    assert %{address: "not found", balance: nil, txids: nil, claimed: nil} ==
             Api.get_address("notexisting")

    # assert 0 == Api.get_address(address.address).unclaimed
  end

  test "get_address_neon/1" do
    #      address = insert(:address)
    #      %{histories: [%{txid: txid}]} = address
    #      insert(:transaction, %{txid: txid})

    assert %{address: "not found", balance: nil, txids: nil, claimed: nil} ==
             Api.get_address_neon("notexisting")

    # assert address.address == Api.get_address_neon(address.address).address
  end

  test "get_asset/1" do
    #      asset = insert(:asset)

    assert %{
             admin: nil,
             amount: nil,
             name: nil,
             owner: nil,
             precision: nil,
             txid: "not found",
             type: nil
           } == Api.get_asset("notexisting")

    #      asset2 = Api.get_asset(asset.txid)
    #      assert asset.txid == asset2.txid
  end

  test "get_block/1" do
    block = insert(:block, %{transactions: [insert(:transaction)]})
    [%{hash: transaction_hash}] = block.transactions

    assert %{
             :confirmations => 1,
             :hash => Base.encode16(block.hash, case: :lower),
             :index => block.index,
             :merkleroot => Base.encode16(block.merkle_root, case: :lower),
             :nextblockhash => "",
             :nextconsensus => Base.encode16(block.next_consensus, case: :lower),
             :nonce => Base.encode16(block.nonce, case: :lower),
             :previousblockhash => "",
             :script => block.script,
             :size => block.size,
             :time => DateTime.to_unix(block.time),
             :transactions => [Base.encode16(transaction_hash, case: :lower)],
             :tx_count => block.tx_count,
             :version => block.version
           } == Api.get_block(block.hash)
  end

  test "get_last_blocks/0" do
    insert(:block)
    insert(:block)
    assert 0 == Enum.count(Api.get_last_blocks())
  end

  test "get_highest_block/0" do
    insert(:block)
    block = insert(:block)
    assert block.index == Api.get_highest_block().index
  end

  test "get_transaction/1" do
    #      transaction = insert(:transaction)
    #      assert transaction.txid == Api.get_transaction(transaction.txid).txid

    assert %{
             asset: nil,
             attributes: nil,
             block_hash: nil,
             block_height: nil,
             claims: nil,
             contract: nil,
             description: nil,
             net_fee: nil,
             nonce: nil,
             pubkey: nil,
             scripts: nil,
             size: nil,
             sys_fee: nil,
             time: nil,
             txid: "not found",
             type: nil,
             version: nil,
             vin: nil,
             vouts: nil
           } == Api.get_transaction("notexisting")
  end

  test "get_last_transactions/1" do
    #      insert(:transaction)
    #      insert(:transaction)
    assert 0 == Enum.count(Api.get_last_transactions(nil))
    assert 0 == Enum.count(Api.get_last_transactions("FactoryTransaction"))
    assert 0 == Enum.count(Api.get_last_transactions("notexisting"))
  end

  test "get_last_transactions_by_address/2" do
    #      transaction = insert(:transaction)
    #      history = insert(:history, %{txid: transaction.txid})
    #      transaction2 = insert(:transaction)
    #      insert(:history, %{address_hash: history.address_hash, txid: transaction2.txid})
    #      insert(:history)

    assert 0 == Enum.count(Api.get_last_transactions_by_address("sds", 1))
    assert 0 == Enum.count(Api.get_last_transactions_by_address("sdds", 2))
  end

  test "get_all_nodes/0" do
    assert 5 == Enum.count(Api.get_all_nodes())
  end

  test "get_nodes/0" do
    assert 5 == Enum.count(Api.get_nodes().urls)
  end

  test "get_height/0" do
    insert(:counter, %{name: "blocks", value: 156})
    assert %{height: 155} == Api.get_height()
  end

  test "get_fees_in_range/1" do
    insert(:block, %{total_net_fee: 2.3, total_sys_fee: 1.4, index: 1})
    insert(:block, %{total_net_fee: 2.3, total_sys_fee: 1.4, index: 750})
    insert(:block, %{total_net_fee: 2.4, total_sys_fee: 1.5, index: 751})

    assert %{total_net_fee: 4.699999999999999, total_sys_fee: 2.9} ==
             Api.get_fees_in_range("500-1000")

    assert "wrong input" == Api.get_fees_in_range("50022")
  end

  test "get_address_abstracts/2" do
    assert [] == Api.get_address_abstracts("not_existing", 1).entries
  end

  test "get_address_to_address_abstracts/3" do
    assert [] == Api.get_address_to_address_abstracts("not_existing", "not_existing", 1).entries
  end
end
