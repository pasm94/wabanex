defmodule Wabanex.Users.Create do
  alias Wabanex.{Repo, User}

  def call(params) do
    # IO.puts("AQUIIIII: #{params}")
    cep = Map.get(params, :cep)
    # IO.puts("AQUIIIII: #{cep}")

    with {:ok, cep_info} <- Wabanex.ViaCep.Client.get_cep_info(cep) do
      %{"cep" => _cep, "uf" => uf, "localidade" => localidade} = cep_info

      params
      |> Map.put(:uf, uf)
      |> Map.put(:city, localidade)
      |> User.changeset()
      |> Repo.insert()
    else
      {:error, _} ->
        params
        |> Map.delete(:cep)
        |> User.changeset()
        |> Repo.insert()
    end
  end
end
