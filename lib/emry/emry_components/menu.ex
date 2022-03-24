defmodule EmryComponents.Menu do
  @moduledoc """
  A liveview **menu (dropdown)** component with accessibility
  and keyboard features built in offering an easy way to build
  custom dropdown components
  """
  use Phoenix.Component
  alias Phoenix.LiveView.JS
  import EmryComponents.Helpers

  @menu_id "emry-headlessui-menu-items-#{UUID.uuid4()}"
  defp menu_id(), do: "#{@menu_id}-#{UUID.uuid4()}"
  @buttin_id "emry-headlessui-button-#{UUID.uuid4()}"
  defp button_id(), do: "#{@button_id}-#{UUID.uuid4()}"

  defp handle_classnames([slot]), do: fn -> format_classnames(slot[:class]) end

  def handle_toggle_menu(js \\ %JS{}, selector) do
    js
    |> JS.toggle(to: "##{selector}")
  end

  def handle_click_away_menu(js \\ %JS{}, selector) do
    js
    |> JS.hide(to: "##{selector}")
  end

  def menu(assigns) do
    assigns =
      assigns
      |> assign_new(:menu_id, &menu_id/0)
      |> assign_new(:button_id, &button_id/0)
      |> assign_new(:button_classes, handle_classnames(assigns.menu_button))
      |> assign_new(:menu_items_classes, handle_classnames(assigns.menu_items))

    ~H"""
    <button
      type="button"
      class={@button_classes}
      phx-click={handle_toggle_menu(@menu_id)}
      phx-click-away={handle_click_away_menu(@menu_id)}
      id={@button_id}
    >
      <%= render_slot(@menu_button) %>
    </button>
    <div
      id={@menu_id}
      class={@menu_items_classes}
      role="menu"
      style="display: none;"
    >
      <%= render_slot(@menu_items) %>
    </div>
    """
  end
end
