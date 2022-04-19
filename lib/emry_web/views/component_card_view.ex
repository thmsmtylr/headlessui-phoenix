# defmodule EmryWeb.ComponentCardView do
#   use EmryWeb, :view

#   def card(assigns) do
#     assigns =
#       assigns
#       |> assign_new(:title, fn -> "" end)

#     ~H"""
#     <div class="bg-secondary rounded-lg shadow-lg">
#       <h2 class="font-black"><%= @title %></h2>
#     </div>
#     """
#   end
# end
