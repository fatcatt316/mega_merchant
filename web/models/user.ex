defmodule MegaMerchant.User do
  use MegaMerchant.Web, :model

  schema "users" do
    has_many :ads, MegaMerchant.Ad

    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/\w+@\w+\.\w+/)
    |> validate_length(:password, min: 7)
  end
end
