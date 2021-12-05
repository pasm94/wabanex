defmodule Wabanex.Files.UploadImage do
  def call(params) do
    %{file: file} = params
    IO.inspect(file)
    File.cp(file.path, "#{File.cwd!()}/xyj/#{file.filename}")

    {:ok, "done"}
  end
end

# MULTIPLART UPLOAD
# query mutation { uploadImage(input: {file:  "users_csv", path: "hhhh"})}
# users_csv imagem
