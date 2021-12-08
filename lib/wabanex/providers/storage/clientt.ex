defmodule Wabanex.Providers.Storage.Client do
  alias Wabanex.Providers.Storage.Behaviour

  @behaviour Behaviour

  def upload_image(file) do
    request = storage_api().upload_image(file)

    case request do
      {:ok, complete_path} -> {:ok, complete_path}
      {:error, reason} -> {:error, reason}
    end
  end

  defp storage_api do
    Application.get_env(:wabanex, :storage_api)
  end
end
