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
end
