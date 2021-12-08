defmodule Wabanex.Files.UploadImage do
  alias Wabanex.Providers.Storage.Client

  def call(%{file: file}) do
    response = Client.upload_image(file)

    case response do
      {:error, reason} -> {:error, reason}
      {:ok, complete_path} -> {:ok, "path: #{complete_path}"}
    end
  end
end
