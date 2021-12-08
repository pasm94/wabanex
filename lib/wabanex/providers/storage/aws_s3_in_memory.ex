defmodule Wabanex.Providers.Storage.AwsS3InMemory do
  alias Wabanex.Providers.Storage.Behaviour

  @behaviour Behaviour

  @bucket "bucket_fake"
  @path "path_fake/"

  def upload_image(file = %Plug.Upload{}) do
    complete_path = @path <> file.filename

    case file.filename do
      nil -> {:error, "Invalid filename"}
      _ -> {:ok, @bucket <> "/#{complete_path}"}
    end
  end
end
