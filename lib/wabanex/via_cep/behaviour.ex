defmodule Wabanex.ViaCep.Behaviour do
  alias Wabanex.Error

  @callback get_cep_info(String.t()) :: {:ok, map()} | {:error, Error.t()}
end
