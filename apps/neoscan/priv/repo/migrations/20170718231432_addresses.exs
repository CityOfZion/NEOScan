defmodule Neoscan.Repo.Migrations.Addresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add(:address, :string)
      add(:balance, :map)
      add(:time, :integer)
      add(:tx_count, :integer)

      timestamps()
    end

    create(unique_index(:addresses, [:address]))
    create(index(:addresses, [:updated_at]))
  end
end
