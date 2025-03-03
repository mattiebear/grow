defmodule Grow.Garden.Plot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plots" do
    field :name, :string

    belongs_to :user, Grow.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(plot, attrs) do
    plot
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unsafe_validate_unique(:user_id, Grow.Repo)
    |> unique_constraint(:user_id)
  end
end
