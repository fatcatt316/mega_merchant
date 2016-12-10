defmodule MegaMerchant.Ad do
  use MegaMerchant.Web, :model

  schema "ads" do
    belongs_to :user, MegaMerchant.User

    field :title, :string
    field :description, :string
    field :price, :decimal

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :price, :user_id])
    |> validate_required([:title, :description, :price, :user_id])
  end
end
