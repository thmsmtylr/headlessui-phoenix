defmodule EmryComponents.Menu do
  @moduledoc """
  A liveview **menu (dropdown)** component with accessibility
  and keyboard features built in offering an easy way to build
  custom dropdown components
  """
  use Phoenix.Component
  alias Phoenix.LiveView.JS
  import EmryComponents.Helpers

  @button_selector "emry-headlessui-menu-items-"

  defp button_selector(), do: "#{@button_selector}-#{UUID.uuid4()}"

  def toggle_menu(js \\ %JS{}, selector) do
    js
    |> JS.toggle(
      in: nil,
      out: "hidden",
      to: "##{selector}"
    )
  end

  def menu(assigns) do
    assigns =
      assigns
      |> assign_new(:button_selector, &button_selector/0)
      |> assign_new(:button_classes, fn ->
        assigns.menu_button |> hd() |> Map.get(:class) |> handle_classnames()
      end)
      |> assign_new(:menu_items_classes, fn ->
        assigns.menu_items |> hd() |> Map.get(:class) |> handle_classnames()
      end)

    ~H"""
    <button
      type="button"
      class={@button_classes}
      phx-click={toggle_menu(@button_selector)}
    >
      <%= render_slot(@menu_button) %>
    </button>
    <div
      id={@button_selector}
      class={@menu_items_classes <> "hidden"}
    >
      <%= render_slot(@menu_items) %>
    </div>
    """
  end
end
