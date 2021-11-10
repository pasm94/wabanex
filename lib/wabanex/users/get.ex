defmodule Wabanex.Users.Get do
  import Ecto.Query

  alias Ecto.UUID
  alias Wabanex.{Repo, Training, User}

  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  def call() do
    handle_response()
  end

  defp handle_response(:error) do
    {:error, "Invalid UUID"}
  end

  defp handle_response({:ok, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, load_training(user)}
    end
  end

  defp handle_response() do
    case Repo.all(User) do
      nil -> {:error, "No users found"}
      users -> {:ok, users}
    end
  end

  defp load_training(user) do
    today = Date.utc_today()

    # ^ (pin) fixa o valor de today, assim ele não pode ser reatribuido
    # sempre deve-se fazer o pin em querys
    query =
      from training in Training,
        where: ^today >= training.start_date and ^today <= training.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
