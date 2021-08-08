defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver

  import_types WabanexWeb.Schema.Types.User

  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      # & pois estamos chamando um function implicitamente e /2 pq o get terah 2 args
      # seria equivalente a fazer:
      # resolve fn params, context -> UserResolver.get(params, context) end
      resolve &UserResolver.get/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
    end
  end
end
