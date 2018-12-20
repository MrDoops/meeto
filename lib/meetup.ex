defmodule Meeto.Meetup do
  @moduledoc """
  Result / Return type once Scheduling work has been done.
  """
  alias Meeto.{
    Host,
    Event,
    Presenter,
  }

  @typedoc "A scheduled meetup"
  @type t() :: %__MODULE__{
    meetup_url: String.t(),
    host: Host,
    event: Event,
    presenters: Presenter,
  }

  @enforce_keys [:meetup_url, :host, :event, :presenters]
  defstruct meetup_url: nil,
            host: nil,
            event: nil,
            presenters: nil
end
