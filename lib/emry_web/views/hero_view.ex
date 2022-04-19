defmodule EmryWeb.HeroView do
  use EmryWeb, :view

  def hero(assigns) do
    ~H"""
    <section class="relative w-full flex flex-col items-center justify-center min-h-[91vh] bg-black">
      <video loop muted playsinline autoplay class="inset-0 w-full h-full absolute object-cover opacity-20" src="../videos/blob.mp4" />
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 class="text-7xl font-black text-white text-center tracking-tight mb-8 z-10">
          <span class="text-transparent bg-gradient-hero bg-clip-text">
            Turbocharge
          </span>
          your
          <br /> Phoenix development
        </h1>
        <p class="text-gray-400 text-xl text-center font-medium lg:max-w-4xl mx-auto z-10 mb-8">
          Emry is a set of unstyled UI components for Phoenix that helps high
          performing teams build functional and accessible web applications faster.
        </p>
        <div class="flex items-center justify-center gap-3">
          <button type="button" class="bg-primary text-black relative inline-flex items-center px-6 py-3 rounded-full focus:outline-none transition-colors hover:bg-white">Start building →</button>
        </div>
      </div>
    </section>
    """
  end
end
