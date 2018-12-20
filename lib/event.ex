defmodule Meeto.Event do
  @moduledoc """
  Event details of a meetup.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name description start_time end_time)a

  @primary_key false
  embedded_schema do
    field :name, :string
    field :description, :string
    field :start_time, :utc_datetime
    field :end_time, :utc_datetime
  end

  def changeset(schema, params) do
    schema
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
