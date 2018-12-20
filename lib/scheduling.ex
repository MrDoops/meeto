defmodule Meeto.Scheduling do
  @moduledoc """
  Internal Business Logic to Schedule Meetups
  """
  alias Meeto.{
    Commands.ScheduleMeetup,
    Meetup,
  }

  @spec do_fancy_scheduling_stuff(Meeto.Commands.ScheduleMeetup.t()) :: Meeto.Meetup.t()
  def do_fancy_scheduling_stuff(%ScheduleMeetup{host: host, presenters: presenters, event: event}) do
    # api requests
    # timezones work
    # notifications
    %Meetup{
      host: host,
      meetup_url: "https://www.meetup.com/utah-elixir/events/256466880/",
      presenters: presenters,
      event: event,
    }
  end
end
