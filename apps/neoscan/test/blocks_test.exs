defmodule Neoscan.BlocksTest do
  use Neoscan.DataCase
  import Neoscan.Factory

  alias Neoscan.Blocks

  test "get/1" do
    block = insert(:block)
    assert block.hash == Blocks.get(block.index).hash
    assert block.index == Blocks.get(block.hash).index
    assert is_nil(Blocks.get(block.index + 1))
  end

  test "paginate/1" do
    for _ <- 1..20, do: insert(:block)
    assert 15 == Enum.count(Blocks.paginate(1))
    assert 5 == Enum.count(Blocks.paginate(2))
  end

  test "get_missing_block_indexes/0" do
    insert(:block, %{index: 0})
    insert(:block, %{index: 2})
    insert(:block, %{index: 4})
    assert [1, 3] == Enum.sort(Blocks.get_missing_block_indexes())
  end

  test "get_max_index/0" do
    assert -1 == Blocks.get_max_index()
    insert(:block, %{index: 0})
    insert(:block, %{index: 2})
    insert(:block, %{index: 4})
    assert 4 == Blocks.get_max_index()
  end

  test "get_sys_fees_in_range/2" do
    insert(:block, %{index: 0, total_sys_fee: 1.0})
    insert(:block, %{index: 2, total_sys_fee: 1.2})
    insert(:block, %{index: 4, total_sys_fee: 1.4})
    insert(:block, %{index: 5, total_sys_fee: 1.6})
    insert(:block, %{index: 6, total_sys_fee: 1.7})
    assert 1.2 + 1.4 + 1.6 == Blocks.get_sys_fees_in_range(2, 5)
  end

  test "get_gas_generated_in_range/2" do
    insert(:block, %{index: 0, gas_generated: 1.0})
    insert(:block, %{index: 2, gas_generated: 1.2})
    insert(:block, %{index: 4, gas_generated: 1.4})
    insert(:block, %{index: 5, gas_generated: 1.6})
    insert(:block, %{index: 6, gas_generated: 1.7})
    assert 1.2 + 1.4 + 1.6 == Blocks.get_gas_generated_in_range(2, 5)
  end
end
