defmodule MegaMerchant.Repo.Migrations.UpdateAdsTable do
  use Ecto.Migration

  def change do
    alter table(:ads) do
      add :photo, :string
    end
  end
end
