defmodule EmryComponents.Modal do
  @moduledoc """
  A liveview **modal** component with accessibility
  and keyboard features
  """
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  def modal(assigns) do
    assigns =
      assigns
      |> assign_new(:inner_block, fn -> nil end)

    id = EmryComponents.Helpers.handle_uuid()

    ~H"""
    <div class="fixed inset-0 z-10 overflow-y-auto" phx-remove={hide_modal()} id={"modal-#{id}"} role="dialog" aria-modal="true" aria-labelledby="headlessui-dialog-title-6">
      <div class="min-h-screen px-4 text-center">
        <div class="fixed inset-0" aria-hidden="true"></div>
        <span class="inline-block h-screen align-middle" aria-hidden="true">​</span>
        <div class="inline-block w-full max-w-md p-6 my-8 overflow-hidden text-left align-middle transition-all transform bg-white shadow-xl rounded-2xl">
          <%= render_slot(@inner_block) %>
          <div class="mt-4">
            <button type="button" class="inline-flex justify-center px-4 py-2 text-sm font-medium text-blue-900 bg-blue-100 border border-transparent rounded-md hover:bg-blue-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-blue-500" tabindex="0">Got it, thanks!</button>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def hide_modal(js \\ %JS{}) do
    js
    |> JS.add_class("hide", to: :id)
  end
end
