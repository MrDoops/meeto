defmodule Meeto.Person do
  @moduledoc """
  A human person.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(first_name last_name)a

  @primary_key false
  embedded_schema do
    field :first_name, :string
    field :last_name, :string
  end

  def changeset(schema, params) do
    schema
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
