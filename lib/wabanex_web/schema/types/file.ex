defmodule WabanexWeb.Schema.Types.File do
  use Absinthe.Schema.Notation

  @desc "Logic file representation"
  # object :file do
  #   field :name, non_null(:string)
  #   field :url, :string
  # end

  input_object :upload_image_input do
    field :file, non_null(:upload)
  end
end
