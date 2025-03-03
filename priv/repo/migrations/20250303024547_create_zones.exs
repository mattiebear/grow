defmodule Grow.Repo.Migrations.CreateZones do
  use Ecto.Migration

  def change do
    create table(:zones) do
      add :name, :string, null: false
      add :width, :integer, null: false
      add :height, :integer, null: false
      add :plot_id, references(:plots, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:zones, [:plot_id])
    create unique_index(:zones, [:name, :plot_id])
  end
end
