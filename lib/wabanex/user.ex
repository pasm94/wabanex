defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}

  # similar ao destructuring do js, @variable eh uma var que soh existe nesse module
  @required_fields [:email, :password, :name]
  @optional_fields [:height, :weight, :cep, :city, :uf]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :height, :float
    field :weight, :float
    field :cep, :string
    field :city, :string
    field :uf, :string

    has_many :trainings, Training

    timestamps()
  end

  def changeset(params) do
    # __MODULE__ eh o Wabanex.User (this)
    %__MODULE__{}
    # quais campos eu quero fazer o cast
    # no caso vai pegar os params fazendo o cast para os campos de @fiels
    |> cast(params, @required_fields ++ @optional_fields)
    # validations
    |> validate_required(@required_fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> validate_number(:height, greater_than: 0, less_than: 3)
    |> validate_number(:weight, greater_than: 0, less_than: 1000)
  end
end
