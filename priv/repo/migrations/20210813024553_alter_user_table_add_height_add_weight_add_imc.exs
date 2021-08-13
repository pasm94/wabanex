defmodule Wabanex.Repo.Migrations.AlterUserTableAddHeightAddWeightAddImc do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :height, :float
      add :weight, :float
    end
  end
end
