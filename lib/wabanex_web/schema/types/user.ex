defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training), resolve: dataloader(Wabanex.Training)
    field :height, :float
    field :weight, :float
    field :cep, :string
    field :city, :string
    field :uf, :string
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
    field :height, :float
    field :weight, :float
    field :cep, :string
  end
end
