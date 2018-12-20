defmodule Meeto do
  @moduledoc """
  Helps with scheduling Meetups.
  """
  alias Meeto.{
    Commands.ScheduleMeetup,
    Scheduling,
  }

  @doc """
  Schedules a meetup
  """
  @spec schedule_meetup(map()) :: {:ok, map()} | {:error, String.t()}
  def schedule_meetup(params \\ %{}) when is_map(params) do
    with {:ok, command} <- ScheduleMeetup.new(params) do
      command
      |> Scheduling.do_fancy_scheduling_stuff()
      |> Map.from_struct()
    else
      {:error, _} = error_message -> error_message
    end
  end
end
