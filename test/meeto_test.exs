defmodule MeetoTest do
  use ExUnit.Case
  doctest Meeto

  alias Ecto.Changeset

  describe "meetup scheduling" do
    setup _ do
      valid = %{
        "group_id" => "utah-elixir",
        "host" => %{"person" => %{"first_name" => "Mark", "last_name" => "Eriksen"}},
        "event" => %{
          "name" => "Nerves LED displays & Clustering Elixir in Kubernetes",
          "description" => "test description",
          "start_time" => DateTime.utc_now |> DateTime.to_iso8601,
          "end_time"   => DateTime.utc_now |> DateTime.to_iso8601,
        },
        "presenters" => [
          %{"person" => %{"first_name" => "Zack", "last_name" => "White"}},
          %{"person" => %{"first_name" => "Michael", "last_name" => "Ries"}},
          %{"person" => %{"first_name" => "Cody", "last_name" => "Poll"}},
        ]
      }

      invalid = %{

      }

      {:ok, %{valid: valid, invalid: invalid}}
    end

    test "returns scheduled meetup with valid params", %{valid: valid} do
      assert {:ok, %{meetup_url: url}} = Meeto.schedule_meetup(valid)
      assert url != nil
    end

    test "returns valid command struct with valid params", %{valid: valid} do
      assert {:ok, command} = Meeto.Commands.ScheduleMeetup.new(valid)
    end

    # test "returns schedule meetup ecto changeset with form: true", %{valid: valid} do
    #   assert {:ok, %Ecto.Changeset{} = changeset_command} = Meeto.Commands.ScheduleMeetup.new(valid, form: true)
    # end
  end


end
