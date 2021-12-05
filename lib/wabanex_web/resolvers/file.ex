defmodule WabanexWeb.Resolvers.File do
  def upload_image(%{input: params}, _context), do: Wabanex.Files.UploadImage.call(params)
end
