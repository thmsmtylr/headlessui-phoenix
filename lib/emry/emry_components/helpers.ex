defmodule EmryComponents.Helpers do
  @doc """
  Remove newlines and extra spaces from a string
  """
  def handle_classnames(string) do
    string
    |> String.replace("\r", " ")
    |> String.replace("\n", " ")
    |> String.split()
    |> Enum.join(" ")
  end

  @doc """
  Generated based on pseudo-random bytes
  `fcfe5f21-8a08-4c9a-9f97-29d2fd6a27b9`
  """
  def handle_uuid() do
    UUID.uuid4()
  end
end
