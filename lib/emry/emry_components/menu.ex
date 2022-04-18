defmodule EmryComponents.Menu do
  @moduledoc """
  A liveview **menu (dropdown)** component with accessibility
  and keyboard features built in offering an easy way to build
  custom dropdown components
  """
  use Phoenix.Component
  use Phoenix.HTML
  alias Phoenix.LiveView.JS
  import EmryComponents.Helpers

  @menu_id "emry-headlessui-menu-items-#{UUID.uuid4()}"
  @button_id "emry-headlessui-button-#{UUID.uuid4()}"

  defp handle_menu_id(), do: "#{@menu_id}-#{UUID.uuid4()}"
  defp handle_button_id(), do: "#{@button_id}-#{UUID.uuid4()}"

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
    ~H"""
    <%= render_slot(@inner_block) %>
    """
  end

  # def menu(assigns) do
  #   assigns =
  #     assigns
  #     |> assign_new(:menu_id, &handle_menu_id/0)
  #     |> assign_new(:button_id, &handle_button_id/0)
  #     |> assign_new(:button_classes, handle_classnames(assigns.menu_button))
  #     |> assign_new(:menu_classes, handle_classnames(assigns.menu_items))

  #   ~H"""
  #   <button
  #     type="button"
  #     class={@button_classes}
  #     phx-click={handle_toggle_menu(@menu_id)}
  #     phx-click-away={handle_click_away_menu(@menu_id)}
  #     id={@button_id}
  #   >
  #     <%= render_slot(@menu_button) %>
  #   </button>
  #   <div
  #     id={@menu_id}
  #     class={@menu_classes}
  #     role="menu"
  #     style="display: none;"
  #   >
  #     <%= render_slot(@menu_items) %>
  #   </div>
  #   """
  # end

  def menu_button(assigns) do
    assigns =
      assigns
      |> assign_new(:as, fn -> nil end)
      |> assign_new(:id, fn -> @button_id end)
      |> assign_new(:menu_id, fn -> @menu_id end)
      |> assign_new(:class, fn -> "" end)

    ~H"""
    <button
      type="button"
      id={@id}
      class={@class}
      phx-click={handle_toggle_menu(@menu_id)}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  def menu_items(assigns) do
    assigns =
      assigns
      |> assign_new(:as, fn -> nil end)
      |> assign_new(:id, fn -> @menu_id end)
      |> assign_new(:class, fn -> "" end)

    ~H"""
    <div
      role="menu"
      id={@id}
      class={@class}
      style="display: none;"
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  def menu_item(assigns) do
    assigns
    |> assign_new(:as, fn -> nil end)
    |> assign_new(:class, fn -> "" end)

    ~H"""
    <%= if Map.has_key?(assigns, :as) do %>
      <%= content_tag assigns[:as], class: assigns[:class] do %>
        <%= render_slot(@inner_block) %>
      <% end %>
    <% else %>
      <div class={assigns[:class]}>
        <%= render_slot(@inner_block) %>
      </div>
    <% end %>
    """
  end
end
