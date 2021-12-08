defmodule Wabanex.Files.Providers.Storage.AwsS3Test do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.Providers.Storage.AwsS3
  alias Plug.Upload

  describe "aws s3 provider" do
    test "upload_image/1" do
      filename = "test_img.png"

      file = %Upload{
        content_type: "image/png",
        filename: filename,
        path: "test/test_image.png"
      }

      response = AwsS3.upload_image(file)

      {_, path} = response

      assert String.contains?(path, filename)

      assert response == {:ok, path}
    end
  end
end
