defmodule NextGearMotors.Vehicles.Vehicle.UploadsStatusType do
  @moduledoc false

  use Ecto.Type

  defguardp is_allowed_atom(value)
            when is_atom(value) and (value == :finished or value == :unfinished)

  def type, do: :string
  def cast(value), do: {:ok, value}
  def load(value) when is_binary(value), do: {:ok, String.to_atom(value)}
  def dump(value) when is_allowed_atom(value), do: {:ok, Atom.to_string(value)}
  def dump(_), do: :error
end
