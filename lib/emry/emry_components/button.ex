defmodule EmryComponents.Button do
  @moduledoc """
  A simple horizontal navigation **tabs** component
  """
  use Phoenix.Component

  # prop class, :string
  # prop color, :string, options: ["primary", "secondary", "info", "success", "warning", "danger", "gray"]
  # prop link_type, :string, options: ["button", "a", "live_patch", "live_redirect"]
  # prop label, :string
  # prop size, :string
  # prop variant, :string
  # prop disabled, :boolean, default: false
  # slot default
  def button(assigns) do
    assigns = assigns
    |> assign_new(:inner_block, fn -> nil end)
    |> assign_new(:size, fn -> "md" end)
    |> assign_new(:disabled, fn -> false end)
    |> assign_new(:to, fn -> nil end)
    |> assign_new(:label, fn -> nil end)
    |> assign_new(:unstyled, fn -> nil end)
    |> assign_new(:type, fn -> "button" end)

    ~H"""
    <button type={@type}>
      <%= if @inner_block do %>
        <%= render_slot(@inner_block) %>
      <% else %>
        <%= @label %>
      <% end %>
    </button>
    """
  end
end
