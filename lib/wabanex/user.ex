defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}

  # similar ao destructuring do js, @variable eh uma var que soh existe nesse module
  @fields [:email, :password, :name]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    has_many :trainings, Training

    timestamps()
  end

  def changeset(params) do
    # __MODULE__ eh o Wabanex.User (this)
    %__MODULE__{}
    # quais campos eu quero fazer o cast
    # no caso vai pegar os params fazendo o cast para os campos de @fiels
    |> cast(params, @fields)
    # validations
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
