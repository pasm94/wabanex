defmodule WabanexWeb.Files.FileSchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Plug.Upload

  describe "mutation: upload image" do
    setup do
      query_upload_image = """
        mutation uploadImage($file: Upload!) {
          uploadImage(
            input: {
              file: $file
            }
          )
        }
      """

      path_key = "images"
      bucket = "images"

      {:ok, query_upload_image: query_upload_image, path_key: path_key, bucket: bucket}
    end

    test "when there is a valid file, path_key, and bucket, returns image saved message", %{
      conn: conn,
      query_upload_image: query_upload_image,
      path_key: path_key,
      bucket: bucket
    } do
      file = %Upload{
        content_type: "image/png",
        filename: "test_img.png",
        path: "test/test_image.png"
      }

      response =
        conn
        |> post("/api/graphql",
          query: query_upload_image,
          variables: %{file: "file"},
          file: file
        )

      assert json_response(response, 200) == %{
               "data" => %{
                 "uploadImage" => "path: bucket_fake/path_fake/test_img.png"
               }
             }
    end
  end
end
