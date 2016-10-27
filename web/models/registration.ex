defmodule MegaMerchant.Registration do
  import Ecto.Changeset, only: [put_change: 3]

  def create(changeset, repo) do
    changeset
    |> put_change(:crypted_password, hashed_password(changeset.params["password"]))
    |> repo.insert() # TODO: Need parens?
  end

  defp hashed_password(password) do
    unless password == nil do
      Comeonin.Bcrypt.hashpwsalt(password)
    end
  end

end