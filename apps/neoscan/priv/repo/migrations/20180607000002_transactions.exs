defmodule Neoscan.Repo.Migrations.Transactions do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add(:id, :bigint, primary_key: true)
      add(:hash, :binary, null: false)
      add(:block_hash, :binary, null: false)
      add(:block_index, :integer, null: false)
      add(:block_time, :naive_datetime, null: false)
      add(:net_fee, :decimal, null: false)
      add(:sys_fee, :decimal, null: false)
      add(:nonce, :bigint, null: true)
      add(:extra, :map, null: false)
      add(:size, :integer, null: false)
      add(:type, :string, null: false)
      add(:version, :integer, null: false)
      add(:n, :integer, null: false)
      timestamps()
    end

    create(index(:transactions, [:hash]))
    create(index(:transactions, [:block_index, :id]))
    create(index(:transactions, [:id], where: "type != 'miner_transaction'", name: "partial_index_block_index"))
  end
end
