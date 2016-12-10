defmodule MegaMerchant.Repo.Migrations.CreateAd do
  use Ecto.Migration

  def change do
    create table(:ads) do
      add :user_id, references(:users)
      add :title, :string
      add :description, :text
      add :price, :decimal

      timestamps()
    end

  end
end
