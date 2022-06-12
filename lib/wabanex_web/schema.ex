defmodule WabanexWeb.Schema do
  use Absinthe.Schema

  alias Wabanex.Training

  import_types WabanexWeb.Schema.Types.Root

  query do
    import_fields :root_query
  end

  mutation do
    import_fields :root_mutation
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Training, Training.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
