defmodule Grow.Garden.Zone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "zones" do
    field :name, :string
    field :width, :integer
    field :height, :integer

    belongs_to :plot, Grow.Garden.Plot

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(zone, attrs) do
    zone
    |> cast(attrs, [:name, :width, :height])
    |> validate_required([:name, :width, :height])
    |> validate_number(:width, min: 1)
    |> validate_number(:height, min: 1)
    |> unsafe_validate_unique([:name, :plot_id], Grow.Repo)
    |> foreign_key_constraint(:plot_id)
    |> unique_constraint([:name, :plot_id])
  end
end
