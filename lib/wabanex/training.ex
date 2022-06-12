defmodule Wabanex.Training do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.{Exercise, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:end_date, :start_date, :user_id]

  schema "trainings" do
    field :start_date, :date
    field :end_date, :date

    belongs_to :user, User
    has_many :exercises, Exercise

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:email])
    |> cast_assoc(:exercises)
  end

  def data() do
    Dataloader.Ecto.new(Wabanex.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
