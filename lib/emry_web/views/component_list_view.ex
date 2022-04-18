defmodule EmryWeb.ComponentListView do
  use EmryWeb, :view

  def component_list(assigns) do
    ~H"""
    <section class="bg-black py-16">
      <div class="grid grid-cols-3 gap-5 w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-gray-500">1</div>
        <div class="text-gray-500">2</div>
        <div class="text-gray-500">3</div>
      </div>
    </section>
    """
  end
end
