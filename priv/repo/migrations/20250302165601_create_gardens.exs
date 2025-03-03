defmodule Grow.Repo.Migrations.CreateGardens do
  use Ecto.Migration

  def change do
    create table(:gardens) do
      add :name, :string, null: false

      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:gardens, [:user_id])
  end
end
