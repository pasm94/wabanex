defmodule Wabanex.Providers.Storage.AwsS3 do
  alias Wabanex.Providers.Storage.Behaviour
  alias ExAws.S3
  alias ExAws.S3.Upload, as: S3Upload

  @behaviour Behaviour

  # @bucket "bucket_in_aws"
  @bucket "dwvimages2"
  @path "path_in_aws/"

  def upload_image(file = %Plug.Upload{}) do
    complete_path = @path <> file.filename

    request =
      file.path
      |> S3Upload.stream_file()
      |> S3.upload(@bucket, @path <> complete_path)
      |> ExAws.request()

    case request do
      {:ok, _} -> {:ok, @bucket <> "/#{complete_path}"}
      {:error, reason} -> {:error, reason}
    end
  end
end
