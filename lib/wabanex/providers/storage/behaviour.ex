defmodule Wabanex.Providers.Storage.Behaviour do
  @callback upload_image(map()) :: {:ok, String.t()} | {:error, String.t()}
end
