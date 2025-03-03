defmodule Grow.Farm.Garden do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gardens" do
    field :name, :string

    belongs_to :user, Grow.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(garden, attrs) do
    garden
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unsafe_validate_unique(:user_id, Grow.Repo)
    |> unique_constraint(:user_id)
  end
end
