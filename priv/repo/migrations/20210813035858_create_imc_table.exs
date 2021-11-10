defmodule Wabanex.Repo.Migrations.CreateImcTable do
  use Ecto.Migration

  def change do
    create table(:imcs) do
      add :imc, :float
      add :user_id, references(:users)
    end
  end
end
