defmodule Meeto.Host do
  @moduledoc """
  A person hosting a meetup
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Meeto.Person

  @primary_key false
  embedded_schema do
    embeds_one :person, Person
  end

  def changeset(schema, _params) do
    schema
    |> cast_embed(:person, required: true)
  end
end
