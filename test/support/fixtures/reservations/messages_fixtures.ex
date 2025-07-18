defmodule NextGearMotors.Reservations.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NextGearMotors.Reservations.Messages` context.
  """
  alias NextGearMotors.AccountsFixtures
  alias NextGearMotors.ReservationsFixtures
  alias NextGearMotors.Reservations.Messages

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{})

  def message_fixture(%{user: user, reservation: reservation} = attrs) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        text: "some text",
        from_id: user.id,
        reservation_id: reservation.id
      })
      |> Messages.create_message()

    message
  end

  def message_fixture(attrs) do
    user = AccountsFixtures.user_fixture()
    reservation = ReservationsFixtures.reservation_fixture()

    {:ok, message} =
      attrs
      |> Enum.into(%{
        text: "some text",
        from_id: user.id,
        reservation_id: reservation.id
      })
      |> Messages.create_message()

    message
  end
end
