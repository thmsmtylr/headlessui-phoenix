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
  # prop variant, :string, default: "default"
  # prop disabled, :boolean, default: false
  # slot default
  def button(assigns) do
    assigns =
      assigns
      |> assign_new(:inner_block, fn -> nil end)
      |> assign_new(:size, fn -> "md" end)
      |> assign_new(:disabled, fn -> false end)
      |> assign_new(:to, fn -> nil end)
      |> assign_new(:label, fn -> nil end)
      |> assign_new(:type, fn -> "button" end)
      |> assign_new(:classnames, fn -> classnames(assigns) end)
      |> assign_new(:variant, fn -> nil end)
      |> assign_new(:phx_click, fn -> nil end)

    ~H"""
    <button
      type={@type}
      disabled={@disabled}
      class={@classnames}
      phx-click={@phx_click}
    >
      <%= if @inner_block do %>
        <%= render_slot(@inner_block) %>
      <% else %>
        <%= @label %>
      <% end %>
    </button>
    """
  end

  defp classnames(opts) do
    opts = %{
      classnames: opts[:classnames] || "",
      variant: opts[:variant] || "default",
      disabled: opts[:disabled] || ""
    }

    variants =
      case opts[:variant] do
        "custom" ->
          opts[:classnames]

        "default" ->
          "inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
      end

    sizes = ""

    disabled = "disabled:cursor-not-allowed opacity-65"

    """
      #{variants}
      #{sizes}
      #{disabled}
    """
    |> EmryComponents.Helpers.handle_classnames()
  end
end
