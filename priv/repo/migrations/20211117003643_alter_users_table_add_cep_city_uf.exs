defmodule Wabanex.Repo.Migrations.AlterUsersTableAddCepCityUf do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :cep, :string
      add :city, :string
      add :uf, :string
    end
  end
end
