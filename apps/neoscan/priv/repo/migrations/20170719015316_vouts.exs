defmodule Neoscan.Repo.Migrations.Vouts do
  use Ecto.Migration

  def change do
    create table(:vouts) do
      add(:transaction_hash, :binary)

      add(:asset, :string)
      add(:address_hash, :string)
      add(:n, :integer)
      add(:value, :float)
      add(:txid, :string)
      add(:time, :integer)

      add(:start_height, :integer)
      add(:end_height, :integer)
      add(:claimed, :boolean)

      add(:query, :string)

      add(:address_id, references(:addresses, on_delete: :delete_all))

      timestamps()
    end

    create(unique_index(:vouts, [:query]))
    create(index(:vouts, [:transaction_hash]))
    create(index(:vouts, [:address_id]))
    create(index(:vouts, [:address_id, :asset]))
    create(index(:vouts, [:address_hash, :asset, :end_height]))
  end
end
