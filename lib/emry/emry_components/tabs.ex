defmodule EmryComponents.Tabs do
  @moduledoc """
  A liveview **tabs** component with accessibility
  and keyboard features built in offering an easy way to build
  custom tabbed interfaces
  """
  use Phoenix.Component
  use Phoenix.HTML
  # alias Phoenix.LiveView.JS
  # import EmryComponents.Helpers

  def tabs(assigns) do
    ~H"""
      <%= render_slot(@inner_block) %>
    """
  end

  def tab(assigns) do
    ~H"""
    <li>
      <a id={@id}>
        <%= render_slot(@inner_block) %>
      </a>
    </li>
    """
  end

  def header(assigns) do
    ~H"""
      <ul>
        <%= render_slot(@inner_block) %>
      </ul>
    """
  end

  def panel(assigns) do
    ~H"""
    <div id={@id}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  def content(assigns) do
    ~H"""
      <div>
        <%= render_slot(@inner_block) %>
      </div>
    """
  end
end
