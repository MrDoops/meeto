defmodule Meeto.Commands.ScheduleMeetup do
  @moduledoc """
  Responsible for validation/sanitization of input parameters required to schedule a meetup.
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Meeto.{
    Presenter,
    Host,
    Event,
  }

  # @primary_key{:id, :binary_id, autogenerate: true}
  @primary_key false
  embedded_schema do
    field :group_id, :string

    embeds_one :host, Host
    embeds_one :event, Event
    embeds_many :presenters, Presenter
  end

  @doc """
  Validate through creation of the Command Struct. With {:ok, command} we're good to go.
  """
  def new(params) do
    command = changeset(params)
    case command.valid? do
      true  -> {:ok, apply_changes(command)}
      false -> {:error, command.errors}
    end
  end

  @doc """
  Provides raw changeset for compatible tooling like Phoenix.
  """
  def new(params, [form: true]), do: changeset(params)

  defp changeset(params) do
    %__MODULE__{}
    |> cast(params, [:group_id])
    |> cast_embed(:host, required: true)
    |> cast_embed(:event, required: true)
    |> cast_assoc(:presenters, required: true, with: &Presenter.changeset/2)
  end
end
